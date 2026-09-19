# Ansible Local Setup

Ansible playbook and role to bootstrap setup of local machines with packages and configurations.

## Install requirements

> NOTE: For now, it only supports macOS systems, pending support for linux distros.

Run the following command to install the requirements for this project:

    make install-requirements

## Install packages and copy configurations

This project uses a Makefile to automate the installation of 3rd party ansible-galaxy roles as well as running the ansible playbook.

    make

> After installing iTerm2, yabai and skhd, you should enable the apps to control the computer, by enabling them under System Preferences -> Security & Privacy -> Privacy -> Accessibility. You'll possibly need to rerun the `make` command in order for all apps to be completely installed / setup.
