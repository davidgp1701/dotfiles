#!/bin/bash

set -eo pipefail

# Finding what the OS is:
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "osx"
else
  echo "OS not supported..."
fi