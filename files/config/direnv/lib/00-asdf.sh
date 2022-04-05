#!/usr/bin/env bash

# https://github.com/asdf-community/asdf-direnv#global-asdf-direnv-integration
set -euo pipefail

# Mimics what asdf direnv setup command produces
use_asdf() {
  source_env "$(asdf direnv envrc "@$")"
}
