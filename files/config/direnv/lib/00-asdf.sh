#!/usr/bin/env bash

# https://github.com/asdf-community/asdf-direnv#global-asdf-direnv-integration
set -euo pipefail
# shellcheck disable=SC1090
source "$(asdf direnv hook asdf)"
