deploy:
    ansible-playbook -i ./inventories playbooks/site.yml

deploy-password:
    ansible-playbook -i ./inventories playbooks/site.yml --ask-pass --ask-become-pass

update:
    ansible-playbook -i ./inventories playbooks/update.yml

lint:
    yamllint .
    ANSIBLE_ROLES_PATH=./roles ansible-lint

deps:
    pip install -r dev-requirements.txt
    ansible-galaxy install -r galaxy-requirements.yml --force
