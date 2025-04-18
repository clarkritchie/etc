#!/usr/bin/env bash

set -e

MAIN=${1:-main}
CURRENT_BRANCH=$(git branch --show-current)
DATE=$(date -u +"%Y-%m-%d-%H-%M")
NEW_BRANCH="${CURRENT_BRANCH}-${DATE}"

if [ -n "$(git status --porcelain)" ]; then
  echo "There are untracked files or pending commits."
  exit 1
fi

echo "Please enter your commit message:"
read commit_message

# Strip leading and trailing double quotes
commit_message="${commit_message%\"}"
commit_message="${commit_message#\"}"

# Prompt the user to continue
cat <<EOF
Squash all commits from ${CURRENT_BRANCH} to ${NEW_BRANCH}.

${commit_message}

EOF
read -p "Press Enter to continue or Ctrl+C to cancel..."

echo "Checking out ${MAIN}"
git checkout ${MAIN}

echo "Making a new branch ${NEW_BRANCH}"
git checkout -b ${NEW_BRANCH}

echo "Squashing ${CURRENT_BRANCH}"
git merge --squash ${CURRENT_BRANCH}

echo "Committing"
git commit -m "${commit_message}"
