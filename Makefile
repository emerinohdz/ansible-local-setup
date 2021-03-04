.PHONY: install-requirements run-playbook

default: run

install-requirements:
	ansible-galaxy install -r requirements.yml

run: install-requirements
	ansible-playbook playbook.yml

configs: install-requirements
	ansible-playbook playbook.yml --tags configs

# vim: autoindent noexpandtab tabstop=4 shiftwidth=4
