#!/usr/bin/env bash
#
# Install kubectl and related packages

set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"


info "Installing dive tool"
(
  DIVE_VERSION="0.9.2" &&
  cd "$(mktemp -d)" &&
  wget https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb &&
  sudo apt install ./dive_${DIVE_VERSION}_linux_amd64.deb
)
success "Dive installed OK"

