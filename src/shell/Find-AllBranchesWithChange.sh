#!/bin/bash
# source: https://stackoverflow.com/a/64467454/

file=$1
base=${2:-main}

if [[ ! -z "$file" ]]; then
echo "Searching for branches with changes to $file related to the $base branch" 
else
 echo "file parameter is empty" && exit -1
fi

if [[ -f $file ]];then
    echo "$file exists"
else
  echo "$file does not exist" &&   exit -1
fi

b=$(tput bold) # Pretty print
n=$(tput sgr0)



# We look through all the local branches using plumbing
for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
  # We're establishing a shared ancestor between base and branch, to only find forward changes.  
  merge_base=$(git merge-base $base $branch)
  # Check if there are any changes in a given path.
  changes=$(git diff $merge_base..$branch --stat -- $file)

  if [[ ! -z $changes ]]; then
    echo "Branch: ${b}$branch${n} | Merge Base: $merge_base"
    # Show change statistics pretty formatted
    git diff $merge_base..$branch --stat -- $file
  fi
done
