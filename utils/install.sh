#!/usr/bin/env bash
#
# Installs basic utilities
# basic folder name is used to quickly hack installation order
set -o errexit -o nounset -o pipefail

# DOTFILES is set by the bootstrap script, if the script is used not use common default
DOTFILES="${DOTFILES:-${HOME}/.dotfiles}"
source "${DOTFILES}/functions/core"

info "Installing extra utilities"

brew install \
  btop \
  dos2unix \
  duf \
  jq \
  jless \
  mc \
  ncdu \
  neofetch \
  tree \
  tmux

success "Extra utilities installed OK"

