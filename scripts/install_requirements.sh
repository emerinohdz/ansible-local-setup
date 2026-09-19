#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This project currently supports macOS only." >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd "${script_dir}/.." && pwd)"

brew_path="$(command -v brew || true)"

if [[ -z "${brew_path}" ]]; then
  echo "Homebrew is not installed. Installing Homebrew..."

  if ! command -v sudo >/dev/null 2>&1; then
    echo "Homebrew is missing, and sudo is required to install it." >&2
    exit 1
  fi

  # Only request administrator access when Homebrew is missing.
  sudo -v
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /bin/bash

  if [[ -x "/opt/homebrew/bin/brew" ]]; then
    brew_path="/opt/homebrew/bin/brew"
  elif [[ -x "/usr/local/bin/brew" ]]; then
    brew_path="/usr/local/bin/brew"
  else
    echo "Homebrew installation completed, but brew could not be found." >&2
    exit 1
  fi
fi

eval "$("${brew_path}" shellenv)"

if ! command -v ansible-galaxy >/dev/null 2>&1; then
  echo "Ansible is not installed. Installing Ansible..."
  brew install ansible
fi

echo "Installing Ansible Galaxy requirements..."
ansible-galaxy collection install -r "${project_dir}/requirements.yml"

echo "Project requirements are installed."
