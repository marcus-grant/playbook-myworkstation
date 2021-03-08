#!/bin/sh
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
ansible-playbook mac.yml -i inventory -l mac --ask-become-pass