#!/usr/bin/env bash

# Installs basic utilities
# abc folder name is used to quickly hack installation order
set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"

info "Installing basic utilities"

# install base utilities using brew
brew install wget

success "Basic utilities installed OK"

# I do not want to override the .ssh if it's already present - only for completely new environments
if [[ ! -e ${HOME}/.ssh ]]
then
  info "Basic .ssh configuration"

  mkdir "${HOME}/.ssh"
cat >  "${HOME}/.ssh/config" << EOL
# too prevent connection closed due to too many failed attempts
# https://www.tecmint.com/fix-ssh-too-many-authentication-failures-error/
Host *
	IdentitiesOnly=yes

# personal gitlab
Host gitlab.com
	HostName gitlab.com
	IdentityFile ~/.ssh/id_rsa_gitlab


# personal github
Host github.com
	HostName github.com
	IdentityFile ~/.ssh/id_rsa_github
EOL
  chmod 600 "${HOME}/.ssh/config"
  success ".ssh configured OK"

fi

# Command line fuzzy finder: https://github.com/junegunn/fzf
info "Installing fzf - Command line fuzzy finder"
brew install fzf
"$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc

