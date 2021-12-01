#/usr/bin/env bash

set -euo pipefail

pushd ~/Documents/synced/neorg
  git-sync-on-inotify.sh
popd
