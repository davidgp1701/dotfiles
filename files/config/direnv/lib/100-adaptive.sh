#!/usr/bin/env bash

set -euo pipefail

_update_required() {
  local -r _update_marker="$1"
  local -r _period="$2"
  local _marker_file_dir
  local _marker_file_name
  _marker_file_dir="$(dirname "${_update_marker}")"
  _marker_file_name="$(basename "${_update_marker}")"
  # `find` outputs filename if it has not been modified in the last N days
  local _find_result
  _find_result="$(find "${_marker_file_dir}" -maxdepth 1 -name "${_marker_file_name}" -type f -mtime +"${_period}" -print)"
  [[ -n "${_find_result}" ]]
}

# Create an exact copy of an existing function with a new name
_save_function() {
  local -r _old_name="$1"
  local -r _new_name="$2"
  local _old_declaration
  local _new_declaration
  _old_declaration="$(declare -f "${_old_name}")"
  _new_declaration="${_new_name}${_old_declaration#${_old_name}}"
  eval "${_new_declaration}"
}

_save_function use_asdf original_use_asdf

use_asdf() {
  local -r _marker_file_dir="${ASDF_DIR}/tmp"
  mkdir -p "${_marker_file_dir}"
  local -r _update_marker="${_marker_file_dir}/.lastupdated"
  if [[ -f "${_update_marker}" ]]; then
    if _update_required "${_update_marker}" 5; then
      log_status "Upgrading ASDF..."
      asdf update
      log_status "Upgrading ASDF plugins..."
      asdf plugin update --all
      touch "${_update_marker}"
    fi
  else
    touch "${_update_marker}"
  fi

  # Delegate to the original ASDF handler
  original_use_asdf "$@"
}

realpath() {
  [[ $1 == /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

asdf_has() {
  if [[ $# -lt 1 ]]; then
    log_error "ERROR: Wrong number of parameters, expected:"
    log_error "       asdf_has [PLUGIN]"
    return 1
  fi
  local _plugin="$1"
  local _plugins
  _plugins=$(asdf plugin list)
  # Quoting the regex variable forces it to be matched as a literal
  # shellcheck disable=SC2076
  if [[ "${_plugins}" =~ "${_plugin}" ]]; then
    return 0
  else
    return 1
  fi
}

layout_python-venv() {
  local python="${1:-python3}"
  [[ $# -gt 0 ]] && shift
  unset PYTHONHOME
  if [[ -n "${VIRTUAL_ENV:-}" ]]; then
    VIRTUAL_ENV="$(realpath "${VIRTUAL_ENV}")"
  else
    local python_version
    python_version="$("$python" -c "import platform; print(platform.python_version())")"
    if [[ -z "$python_version" ]]; then
      log_error "ERROR: Could not detect Python version"
      return 1
    fi
    VIRTUAL_ENV="$(direnv_layout_dir)/python-$python_version-venv"
  fi
  export VIRTUAL_ENV
  if [[ ! -d "$VIRTUAL_ENV" ]]; then
    log_status "no venv found; creating $VIRTUAL_ENV"
    "$python" -m venv "$VIRTUAL_ENV"
  fi

  PATH_add "${VIRTUAL_ENV}/bin"
}

layout_poetry() {
  if [[ ! -f "pyproject.toml" ]]; then
    log_error "No pyproject.toml found. Use \`poetry new\` or \`poetry init\` to create one first."
    exit 2
  fi

  VIRTUAL_ENV=$(
    poetry env info --path 2> /dev/null || true
  )

  if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
    poetry run true
    VIRTUAL_ENV=$(poetry env info --path)
  fi

  poetry install

  PATH_add "$VIRTUAL_ENV/bin"
  export POETRY_ACTIVE=1
  export VIRTUAL_ENV
}

use_pre-commit() {
  pre-commit install --install-hooks --hook-type pre-commit --hook-type prepare-commit-msg --hook-type commit-msg
}

use_git-message-template() {
  if [[ -r "$(git rev-parse --show-toplevel)/.gitmessage" ]]; then
    if ! git config --local --get commit.template; then
      git config --local --add commit.template .gitmessage
    fi
  fi
}

use_pipx() {
  if ! has python3; then
    log_error "ERROR: Python 3 version 3.6 or higher required for PipX"
    return 1
  fi

  if [[ -n "${VIRTUAL_ENV:-}" ]]; then
    if ! python3 -m pip show -qq pipx; then
      log_status "Installing PipX into virtual env"
      python3 -m pip install --upgrade pip setuptools pipx
    fi
  else
    if ! has easy_install3; then
      # `setuptools` is not a direct dependency of `pipx`, but it is required for correct operation
      python3 -m pip install --user setuptools
    fi
    if ! has pipx; then
      log_status "Installing PipX for the current user"
      python3 -m pip install --user pipx
    fi
  fi

  # shellcheck disable=SC2155
  export PIPX_HOME="$(direnv_layout_dir)/pipx"
  export PIPX_BIN_DIR="${PIPX_HOME}/bin"
  PATH_add "${PIPX_BIN_DIR}"

  ## Periodic PipX package upgrades
  mkdir -p "${PIPX_HOME}"
  local -r _update_marker="${PIPX_HOME}/.lastupdated"
  if [[ -f "${_update_marker}" ]]; then
    if _update_required "${_update_marker}" 5; then
      log_status "Upgrading PipX packages..."
      pipx upgrade-all
      touch "${_update_marker}"
    fi
  else
    touch "${_update_marker}"
  fi
}

use_docker-credential-helper-ecr() {
  if [[ $# -lt 3 ]]; then
    log_error "ERROR: Wrong number of parameters, expected:"
    log_error "       use docker-credential-helper-ecr <AWS profile> <AWS account ID> <ECR region>"
    return 1
  fi

  local -r _profile="$1"
  local -r _account="$2"
  local -r _region="$3"

  local _shim_dir
  _shim_dir="$(direnv_layout_dir)/bin"
  mkdir -p "${_shim_dir}"

  # Quoting the regex variable forces it to be matched as a literal
  # shellcheck disable=SC2076
  if [[ ! "${PATH}" =~ "${_shim_dir}" ]]; then
    PATH_add "${_shim_dir}"
  fi

  # Add helper shim script
  local _helper="ecr-${_profile}"
  local _helper_filename="docker-credential-${_helper}"
  local _helper_path="${_shim_dir}/${_helper_filename}"
  if [[ ! -f "${_helper_path}" ]]; then
    cat > "${_helper_path}" << EOF
#!/usr/bin/env bash
AWS_PROFILE="${_profile}" docker-credential-ecr-login "\$@"
EOF
    chmod +x "${_helper_path}"
  fi

  # Clone the existing docker configuration locally
  local OLD_DOCKER_CONFIG="${DOCKER_CONFIG:-${HOME}/.docker}"
  DOCKER_CONFIG="$(direnv_layout_dir)/dockerconfig"
  if [[ ! -d "${DOCKER_CONFIG}" ]]; then
    mkdir -p "${DOCKER_CONFIG}"
  fi
  if [[ "${OLD_DOCKER_CONFIG}" != "${DOCKER_CONFIG}" ]] && [[ -f "${OLD_DOCKER_CONFIG}/config.json" ]]; then
    # Sync newer files only
    if [[ ! -f "${DOCKER_CONFIG}/config.json" ]] || [[ "${OLD_DOCKER_CONFIG}/config.json" -nt "${DOCKER_CONFIG}/config.json" ]]; then
      cp -a "${OLD_DOCKER_CONFIG}/config.json" "${DOCKER_CONFIG}/config.json"
    fi
  fi
  if [[ ! -f "${DOCKER_CONFIG}/config.json" ]]; then
    echo "{}" > "${DOCKER_CONFIG}/config.json"
  fi
  export DOCKER_CONFIG

  # Integrate helper with docker
  local _registry="${_account}.dkr.ecr.${_region}.amazonaws.com"
  local _temp_config
  _temp_config="$(mktemp config.json.XXXXXX)"
  jq --sort-keys --arg registry "${_registry}" --arg helper "${_helper}" '.credHelpers[$registry] = $helper' "${DOCKER_CONFIG}/config.json" \
    | jq --sort-keys --arg registry "${_registry}" '.auths[$registry] = {}' \
      > "${_temp_config}"
  mv -f "${_temp_config}" "${DOCKER_CONFIG}/config.json"
}
