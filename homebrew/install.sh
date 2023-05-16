#!/usr/bin/env bash

# Installs basic utilities
# abc folder name is used to quickly hack installation order
set -o errexit -o nounset -o pipefail

source "${DOTFILES}/functions/core"

brewInstall () {
    # Install brew
    if test ! "$(which brew)"; then
    # Install the correct homebrew for each OS type
        if test "$(uname)" = "Darwin"
        then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
            success 'brew installed'
        fi
    else
        info 'brew is already installed'
    fi
}

brewUpdate () {
    brew update
    success 'brew updated'
}

brewInstall
brewUpdate
