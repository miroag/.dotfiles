#!/usr/bin/env bash
# Install helm and alike

set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"

brew install helm

(
  if ! helm plugin install https://github.com/databus23/helm-diff &> /dev/null; then
    helm plugin update diff &> /dev/null
  fi
  success "..."
)

brew install helmsman
