#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

brew install terragrunt

