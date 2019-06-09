#!/bin/bash

set -eo pipefail

dirname="$( cd "$(dirname "$0")" ; pwd -P )"

distro="$("${dirname}"/../common/get_distro.sh)"

if [ "${distro}" = "arch" ]
then
  "${dirname}"/arch/install.sh
fi