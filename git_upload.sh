#!/bin/bash

cd D:/study/hexoBlog

if [ -z $(git status -s) ]; then
  echo "No changes detected, skipping commit and push."
  exit 0
fi

git add .

git commit -m "auto"

git push
