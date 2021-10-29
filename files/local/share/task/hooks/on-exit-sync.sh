#!/usr/bin/env bash

# Based on this: https://www.reddit.com/r/taskwarrior/comments/4mwhvk/a_script_to_autosync_after_every_modification/
set -euo pipefail

# Count the number of tasks modified
n=0
while read modified_task
do
    n=$(($n + 1))
done

if (($n > 0))
then
    task sync >> ~/.local/var/log/task_sync_hook.log
fi

exit 0
