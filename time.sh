#!/bin/bash

echo "test"
echo "当前目录：$(pwd)"

find source/_posts -name '*.md' | while read file; do 
    touch -d "$(git log -1 --format="@%ct" "$file")" "$file"
done