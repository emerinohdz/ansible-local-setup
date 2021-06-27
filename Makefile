.PHONY: install-requirements run-playbook

default: install-requirements run

install-requirements:
	ansible-galaxy install -r requirements.yml

run: 
	ansible-playbook playbook.yml

configs: 
	ansible-playbook playbook.yml --tags configs -v

packages:
	ansible-playbook playbook.yml --tags packages -v

