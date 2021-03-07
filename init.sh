#!/bin/sh

LATEST_PYTHON_VERSION="3.9.1"

# Ensure Apple's command line tools are installed
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install python based off this opensource.com tutorial for proper setup
# https://red.ht/3rsfyOs
/opt/homebrew/bin/brew install pyenv
pyenv install $LATEST_PYTHON_VERSION
pyenv global $LATEST_PYTHON_VERSION

# Then finally install ansible
pip install --upgrade pip
pip install ansible

# TODO: Remove later once the zprofile has these valules
# Some defaults
# For VS Code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium
# defaults delete -g ApplePressAndHoldEnabled
echo "Also installed some defaults"

#### OLD WAY - Remove if not needed anymore
# # Install ansible
# # Install pip
# curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
# python3 /tmp/get-pip.py --user
# # First upgrade pip
# pip install --upgrade pip
# # Install ansible
# python3 -m pip install --user ansible
