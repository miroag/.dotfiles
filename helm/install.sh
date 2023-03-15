#!/usr/bin/env bash
# Install helm and alike

set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"

# https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
if [[ "${ENVIRONMENT}" != ACS ]]; then
  info "Installing helm"
  (
    VERSION_HELM="3.11.2"
    # https://helm.sh/docs/intro/install/
    cd "$(mktemp -d)"
    curl -Lo helm-linux-amd64.tar.gz https://get.helm.sh/helm-v${VERSION_HELM}-linux-amd64.tar.gz
    tar -zxvf helm-linux-amd64.tar.gz
    sudo mv linux-amd64/helm /usr/local/bin/helm
  )
  success "..."
fi

info "Installing helm plugins"
(
  info "Installing helm diff plugin"
  if ! helm plugin install https://github.com/databus23/helm-diff &> /dev/null; then
    helm plugin update diff &> /dev/null
  fi
  success "..."
)

info "Installing helmsman"
(
  VERSION_HELMSMAN=3.11.0
  cd "$(mktemp -d)"
  curl -Lo helmsman.gz https://github.com/Praqma/helmsman/releases/download/v${VERSION_HELMSMAN}/helmsman_${VERSION_HELMSMAN}_linux_amd64.tar.gz
  tar xzvf helmsman.gz
  mv helmsman ${HOME}/bin
)

success "Helmsman installed OK"

