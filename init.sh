#!/bin/sh

# Ensure Apple's command line tools are installed
xcode-select --install

# Install ansible
# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py --user
# First upgrade pip
pip install --upgrade pip
# Install ansible
python3 -m pip install --user ansible

# Some defaults
# For VS Code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium
# defaults delete -g ApplePressAndHoldEnabled
echo "Also installed some defaults"