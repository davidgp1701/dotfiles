#!/bin/bash

set -eo pipefail

dirname="$( cd "$(dirname "$0")" ; pwd -P )"

distro="$("${dirname}"/../common/get_distro.sh)"

if [ "${distro}" = "arch" ]
then

  xps15_9570=0

  if [ -z "${1}" ]
  then
    if [ "${1}" = "xps15_9570" ]
    then
      xps15_9570=1
    fi
  fi

  XPS15_9570="${xps15_9750}" "${dirname}"/arch/install.sh

elif [ "${distro}" = "osx" ]
then
  "${dirname}"/osx/install.sh
fi