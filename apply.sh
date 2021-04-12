#!/bin/bash

ROOTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
export ROOTDIR

hostname="$(hostname -f)"

ansible-playbook local.yml -l "$hostname"

