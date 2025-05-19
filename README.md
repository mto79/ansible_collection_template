Ansible Collection template
========================================
Documentation for collection template.

Contents
========

Roles
------
Role | Description | CI Status
--- | --- | ---

Click on the role to see the README for that role.  

Collection Structure
--------------

This collection makes use of my [Ansible Role Template repository](https://github.com/mto79/ansible_role_%74emplate.git).  The `add-role.sh` script downloads this Template and generates a new role with the name specified. If a `molecule/default/molecule.yml` file is present, it will be ran with GitHub Actions.  

Usage:
```bash
export NEW_ROLE_NAME="new_role"
./add-role.sh ${NEW_ROLE_NAME}
```

Using Template
--------------
To use this template for a new collection, run the script `replace.sh` to apply a new name, user, etc.
