#!/usr/bin/env bash
# Install helm and alike

set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"

# https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
if [[ "${ENVIRONMENT}" != ACS ]]; then
  info "Installing Go"
  (
    VERSION_GO="1.20.2"

    # https://helm.sh/docs/intro/install/
    cd "$(mktemp -d)"
    curl -Lo go.tar.gz https://go.dev/dl/go${VERSION_GO}.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf go.tar.gz
  )
  success "..."
fi

success "All Go installation is complete"

