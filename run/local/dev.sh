PYTHONUNBUFFERED=1
ANSIBLE_FORCE_COLOR=true
ANSIBLE_HOST_KEY_CHECKING=false
ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_NOCOWS=1

# grab the only argument as a 'become' password
_ANS_BECOME_PASSWD='--ask-become-pass'
if [ $# -gt 0 ]; then
    _ANS_BECOME_PASSWD="--extra-vars \"ansible_sudo_pass=$1\""
fi

# first check that ansible-galaxy requirements are met
ansible-galaxy install -r requirements.yml

# The local bits come from : shorturl.at/jzR68
_ANS_PLAY_COMMAND="ansible-playbook
$_ANS_BECOME_PASSWD 
--connection=local 
--inventory 127.0.0.1, 
--limit 127.0.0.1 
dev.yml"

eval $_ANS_PLAY_COMMAND
# echo $_ANS_PLAY_COMMAND
