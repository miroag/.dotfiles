#!/usr/bin/env bash
#
# Install kubectl and related packages

set -o errexit -o nounset -o pipefail
source "${DOTFILES}/functions/core"

info "Installing python3 and extra utilities"

if [[ "${SUDO_ALLOWED}" = true ]]; then
  sudo apt install python3-pip
fi

# poetry (does not require sudo)
curl -sSL https://install.python-poetry.org | python3 -

pip3 install -U tldr speedtest-cli

success "Python utilities installed OK"

