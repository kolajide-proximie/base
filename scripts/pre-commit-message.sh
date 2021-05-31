#!/bin/sh

echo "Validating your commit message"

# regexes to validate in commit message

RED='\033[0;31m'
BRED='\033[1;31m'

NC='\033[0m'

commit_regex='^(feat|fix|docs|style|refactor|perf|test|chore)(\(([a-zA-Z0-9 \-]+)\))?:'
error_message="

${BRED}Please use semantic commit messages:${NC}

<type>(<scope>): <subject>

${BRED}types:${NC}

- ${RED}feat${NC}: A new feature
- ${RED}fix${NC}: A bug fix
- ${RED}docs${NC}: Documentation only changes
- ${RED}style${NC}: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- ${RED}refactor${NC}: A code change that neither fixes a bug nor adds a feature
- ${RED}perf${NC}: A code change that improves performance
- ${RED}test${NC}: Adding missing or correcting existing tests
- ${RED}chore${NC}: Changes to the build process or auxiliary tools and libraries such as documentation generation

${BRED}scope:${NC}

Matches [a-zA-Z0-9 \-]+]

"

if ! grep -qE "$commit_regex" .git/COMMIT_EDITMSG && ! grep -qE "merge" .git/COMMIT_EDITMSG; then
    echo -e "$error_message" >&2
    exit 1
fi


# regex to validate in commit message
commit_regex='(#P40-[0-9]+|Bump|merge|noticket)'
error_message="

<type>(<scope>): <subject>

${BRED}Your commit message is missing one of the following labels in the subject:${NC}

- ${RED}#P40-1234${NC}: A Jira ticket number
- ${RED}noticket${NC}: Only use this when there is no ticket for this commit
- ${RED}merge${NC}: When want to commit a merge

"

if ! grep -iqE "$commit_regex" .git/COMMIT_EDITMSG; then
    echo -e "$error_message" >&2
    exit 1
fi