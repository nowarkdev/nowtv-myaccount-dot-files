#!/bin/bash

printf "Please enter your initials: "
read initials

KEY_PATH="${HOME}/.ssh/id_${initials}_rsa"

if [ -f "$KEY_PATH" ]
then
  ssh-add -t 60 $KEY_PATH
  exit 0
fi

RED="\e[1;31m"
echo -e "${RED}User SSH Key not found. Please add the key ${HOME}/.ssh/id_${initials}_rsa"
exit 1
