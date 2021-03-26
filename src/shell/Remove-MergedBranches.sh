# Source: https://stackoverflow.com/a/6127884
git branch --merged | egrep -v "(^\*|master|main)" | xargs git branch -d
git remote prune origin