.PHONY: install-requirements run-playbook

default: run-playbook

install-requirements:
	ansible-galaxy install -r requirements.yml

run-playbook: install-requirements
	ansible-playbook playbook.yml

# vim: autoindent noexpandtab tabstop=4 shiftwidth=4
