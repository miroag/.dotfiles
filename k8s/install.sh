#!/usr/bin/env bash
#
# Install kubectl and related packages

set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"

brew install kubectl
brew install dive
brew install k9s

brew install krew
kubectl krew install ctx
kubectl krew install iexec
kubectl krew install images
kubectl krew install kuttl
kubectl krew install ns
kubectl krew install tree

brew install minikube
minikube addons enable ingress
brew install kind
brew install --cask lens

brew install mkcert nss
