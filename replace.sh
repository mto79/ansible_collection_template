#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Enter role name: "
    read NEW_COLLECTION_NAME
else
    NEW_COLLECTION_NAME=$1
fi

find docs meta playbooks plugins roles galaxy.yml README.md \
    -type f -exec sed -i -e "s/template/${NEW_COLLECTION_NAME}/g" {} + # Do not run this more than once

# Remove this section from README.md
# Run a sample `sed` command to check the behavior
sed -n '1p' <<< "Testing"
# Check the exit code to determine the sed version
if [[ $? -eq 0 ]]; then
  echo "sed is based on GNU"
  sed -i "/Creating a new collection/Q" README.md
else
  echo "sed is based on BSD"
  sed -i "" '/Creating a new collection/,$d' README.md
fi

# Role Structure

rm ./replace.sh
