#!/bin/bash

# This script will pull down all branches on the remote repository and start tracking them locally
# Run this script from any git directory: `~/path/to/get_all_branches.sh /path/to/git/repo`

# Save the current working directory
original_dir=$(pwd)

# Check if the user provided a path argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Navigate to the specified directory
cd "$1" || { echo "Failed to change directory to $1"; exit 1; }

# see: https://stackoverflow.com/a/10312587
git branch -r \
  | grep -v '\->' \
  | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" \
  | while read remote; do \
      git branch --track "${remote#origin/}" "$remote"; \
    done
git fetch --all
git pull --all

# Return to the original directory
cd "$original_dir" || { echo "Failed to return to the original directory"; exit 1; }