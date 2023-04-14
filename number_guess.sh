#!/bin/bash

echo -e "Enter your username:"
read USERNAME

NUMBER=$((1 + RANDOM % 100))

if [ ${#USERNAME} -le 22];
then
  # echo accepted
  echo accepted

else
  # echo is not accpted
  exit 1
fi