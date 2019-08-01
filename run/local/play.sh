PYTHONUNBUFFERED=1
ANSIBLE_FORCE_COLOR=true
ANSIBLE_HOST_KEY_CHECKING=false
ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_NOCOWS=1

# first check that ansible-galaxy requirements are met
ansible-galaxy install -r requirements.yml

ansible-playbook \
--ask-become-pass \
--connection=local \
--inventory 127.0.0.1, \
--limit 127.0.0.1 \
playbook.yml
