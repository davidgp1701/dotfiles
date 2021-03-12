#!/bin/bash

ROOTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
export ROOTDIR

ansible-playbook local.yml

