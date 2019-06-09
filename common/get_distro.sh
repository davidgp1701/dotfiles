#!/bin/bash

set -eo pipefail

os="$("$(dirname "$0")"/get_os.sh)"

# Find the distro
if [ "${os}" = "linux" ]
then
  source /etc/os-release
  echo "$ID"
elif [ "${os}" = "osx" ]
then
  echo "${os}"
fi