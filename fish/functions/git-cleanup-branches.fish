function git-cleanup-branches
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
end
