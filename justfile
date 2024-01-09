deploy:
    which ansible-playbook || just deps
    ansible-playbook -i ./inventories playbooks/site.yml

deploy-password:
    which ansible-playbook || just deps
    ansible-playbook -i ./inventories playbooks/site.yml --ask-pass --ask-become-pass

update:
    which ansible-playbook || just deps
    ansible-playbook -i ./inventories playbooks/update.yml

lint:
    which yamllint || just deps
    yamllint .
    ANSIBLE_ROLES_PATH=./roles ansible-lint

deps:
    pip install -r dev-requirements.txt
    ansible-galaxy install -r galaxy-requirements.yml --force
