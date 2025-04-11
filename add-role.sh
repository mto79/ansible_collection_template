#!/usr/bin/env bash

COLLECTION_NAME=$(grep '^name:' galaxy.yml | awk '{print $2}' | sed 's/^"\(.*\)"$/\1/')

echo "Enter role name: "
read ROLE_NAME

mkdir -p ./roles/$ROLE_NAME

git clone --depth 1 --branch main https://github.com/mto79/ansible_role_template.git roles/$ROLE_NAME

cd ./roles/$ROLE_NAME

rm -rf .git .gitignore .pre-commit-config.yaml

ROLE_IN_COLLECTION="true" bash replace.sh $ROLE_NAME

cd ../../

cat >playbooks/${ROLE_NAME}.yml <<EOF
---
- name: Run the mto79.${COLLECTION_NAME}.${ROLE_NAME} role.
  hosts: '{{ target | default("${ROLE_NAME}") }}'
  roles:
    - { role: mto79.${COLLECTION_NAME}.${ROLE_NAME}, tags: ['${COLLECTION_NAME}', '${ROLE_NAME}']}

...
EOF
