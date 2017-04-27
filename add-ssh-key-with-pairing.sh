#!/bin/bash

# Installation
# 1. Install bash 4. `brew update && brew install bash`
# 2. Install Git Duet via HomeBrew - https://github.com/git-duet/homebrew-tap
# 3. Add a ~/.git-authors file - https://github.com/git-duet/git-duet#setup
# 4. Generate a ssh key with name id_[YOUR_INITIALS]_rsa
# 5. Give the script permissions. `chmod +x add-ssh-key-with-pairing.sh`
# 6. Alias git-secure to run this script. `alias git-secure="bash ${HOME}/dot-files/add-ssh-key.sh"`

soloRegex="^([A-Z]{2,3})$"
pairRegex="^([A-Z]{2}) ([A-Z]{2,3})$"
RED="\e[1;31m"

read -p "Please enter your initials: " initials

if [[ $initials =~ $soloRegex ]]; then
  SSH_KEY_INITIALS="${BASH_REMATCH[1]}"
  git solo "${SSH_KEY_INITIALS}"
elif [[ $initials =~ $pairRegex ]]; then
  SSH_KEY_INITIALS="${BASH_REMATCH[1]}"
  git duet "${SSH_KEY_INITIALS}" "${BASH_REMATCH[2]}"
else
  echo -e "${RED}Those initials are not recognised!"
  exit 1
fi

KEY_PATH="${HOME}/.ssh/id_${SSH_KEY_INITIALS}_rsa"

if [ -f "$KEY_PATH" ]; then
  ssh-add -t 60 $KEY_PATH
  exit 0
fi

echo -e "${RED}User SSH Key not found. Please add the key ${HOME}/.ssh/id_${SSH_KEY_INITIALS}_rsa"
exit 1
