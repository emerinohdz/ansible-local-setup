.PHONY: install-requirements run-playbook

default: install-requirements run

install-requirements:
	./scripts/install_requirements.sh

run: 
	ansible-playbook playbook.yml

configs: 
	ansible-playbook playbook.yml --tags configs -v

packages:
	ansible-playbook playbook.yml --tags packages -v
