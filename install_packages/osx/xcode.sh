#!/bin/bash

set -eo pipefail

if [ ! -f /usr/bin/git ]
then
  xcode-select --install
fi