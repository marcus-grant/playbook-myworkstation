
PYTHONUNBUFFERED=1
ANSIBLE_FORCE_COLOR=true
ANSIBLE_HOST_KEY_CHECKING=false
ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_NOCOWS=1

# grab the only argument as a 'become' password
_ANS_BECOME_PASSWD='--ask-become-pass'
_ANS_TAG=''
if [ $# -gt 0 ]; then
    _ANS_BECOME_PASSWD="--extra-vars \"ansible_sudo_pass=$1\""
fi
if [ $# -gt 1 ]; then
    _ANS_TAG="--tags \"$2\""
fi

# first check that ansible-galaxy requirements are met
ansible-galaxy install -r requirements.yml

# todo set it up so it can be run through net as well
# The local bits come from : shorturl.at/jzR68
_ANS_PLAY_COMMAND="ansible-playbook
$_ANS_BECOME_PASSWD 
$_ANS_TAG
--connection=local 
--inventory 127.0.0.1, 
--limit 127.0.0.1 
odin.yml"
# NOTE: That dev.yml becomes odin.yml in project root

eval $_ANS_PLAY_COMMAND
# echo $_ANS_PLAY_COMMAND
