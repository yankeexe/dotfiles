#!/bin/sh
# Push changes to your current branch
set -e

CURRENT_BRANCH=$(git branch --show-current)
CURRENT_REMOTE=$(git remote -v | awk '{print $1; exit}')


help_message() {
	echo "ppush lets you push to your current working branch\n"
	echo "Usage:"
	echo "\tgit ppush"
	echo "\tgit ppush --<flags>"
    echo "\tgit ppush help or git ppush -h"
}

branch_info() {
    echo Pushing to branch: "$CURRENT_BRANCH"
    echo "---"
}


# Check argument exists
if [ "$#" -ne 1 ]; then
    branch_info
    git push "${CURRENT_REMOTE}" "${CURRENT_BRANCH}"
elif [ "$1" = help ] || [ "$1" = "-h" ];then
    help_message
else
    branch_info
    # Allow flags in cmd
   git push "$@" "${CURRENT_REMOTE}" "${CURRENT_BRANCH}"
fi
