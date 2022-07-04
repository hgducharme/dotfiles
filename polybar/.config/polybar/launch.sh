#!/usr/bin/env bash

# Terminate already running bar instances
# polybar-msg cmd quit # you can only use this if all the bars have ipc enabled
killall -q polybar

# Wait until all polybars have been shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch each bar
echo "----" | tee -a /tmp/workspaces.log /tmp/info.log
polybar info 2>&1 | tee -a /tmp/info.log & disown
polybar workspaces 2>&1 | tee -a /tmp/workspaces.log & disown
# polybar apps 2>&1 | tee -a /tmp/apps.log & disown

echo "polybars launched..."
