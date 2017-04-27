#!/bin/bash

RED="\e[1;31m"

if ssh-add -l | grep "no identities"; then
  echo -e "${RED}Please run git-secure before commiting"
fi
