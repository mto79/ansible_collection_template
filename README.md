# ansible_collection_template
Ansible collection template.


## [Pre-commit](#pre-commit)

Install pre-commit

```bash
pip install pre-commit
```

Set hooks in .pre-commit-config.yaml

```bash
repos:
- repo: https://github.com/ansible/ansible-lint.git
  rev: v4.2.0
  hooks:
    - id: ansible-lint
      files: \.(yaml|yml)$
```

Enable pre-commit for your git repository

```bash
$ pre-commit install
pre-commit installed at .git/hooks/pre-commit
```

Testing pre-commit

```bash
pre-commit run --all-files
Ansible-lint.............................................................Passed
```

or just type:

```bash
git commit
```

Creating a new collection
-------------------------

To create a new repository from this template, create a new repository on GitLab. You can do this in the [GitLab UI](https://gitlab.proxy.nl/projects/new) or by running the following command:
```bash
export NEW_COLLECTION_NAME="NEW_NAME"
glab repo create /mst/ansible/collections/ansible_collection_mto79.${NEW_COLLECTION_NAME} # Or other path
```

Clone the repository and apply this template by running the following commands:
```bash
git clone https://gitlab.proxy.nl/mst/ansible/collections/ansible_collection_mto79.${NEW_COLLECTION_NAME} # Or other path, make sure to keep the ansible_collection_mto79. prefix
cd ansible_collection_mto79.${NEW_COLLECTION_NAME}

git clone https://gitlab.proxy.nl/mst/ansible/templates/ansible_collection_mto79.template
rm -rf ansible_collection_mto79.template/.git
mv ansible_collection_mto79.template/.* ansible_collection_mto79.template/* .
rm -d ansible_collection_mto79.template

./replace.sh ${NEW_COLLECTION_NAME}
```

Using Template
--------------

To replace all instances of `template` with the name of the collection, run the following commands:

```bash
export NEW_COLLECTION_NAME="NEW_NAME"

find . -type f -exec sed -i "s/template/${NEW_COLLECTION_NAME}/g" {} + # Do not run this more than once

# Remove this section from README.md
sed -i "/Creating a new collection/Q" README.md
```

This is also provided as a script as `replace.sh`.  

This is already run when following the steps in [Creating a new collection](#creating-a-new-collection)!  
