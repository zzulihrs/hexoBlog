#!/bin/bash

cd D:/study/hexoBlog  # 切换目录

git pull

if [ -z $(git status -s) ]; then  # 如果没有改变，就不提交
  echo "No changes detected, skipping commit and push."
  exit 0
fi

git add .  # git提交命令

git commit -m "auto"

git push