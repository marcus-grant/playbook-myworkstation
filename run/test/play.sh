
# look here for info: https://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html
# ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant
get-script-dir(){
    source="${BASH_SOURCE[0]}"
    while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
      dir="$( cd -P "$( dirname "$source" )" && pwd )"
      source="$(readlink "$source")"
      # if $source was a relative symlink, we need to resolve it relative
      # to the path where the symlink file was located
      [[ $source != /* ]] && source="$dir/$source"
    done
    echo "$( cd -P "$( dirname "$source" )" && pwd )"
}

# Script Args
scriptDir="$(get-script-dir)"
projectDir="$(dirname $(dirname $scriptDir))"
pBook="$projectDir/playbook.yml"
invent="$projectDir/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory"
privateKey="$projectDir/.vagrant/machines/default/virtualbox/private_key"
pBookUser="vagrant"

# Ansible env vars for running its commands
PYTHONUNBUFFERED=1
ANSIBLE_FORCE_COLOR=true
ANSIBLE_HOST_KEY_CHECKING=false
ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s'

# Debug message before running play
echo "Running playbook.yml for vagrant instance..."
echo "============================================"
echo "(projectDir: $projectDir)"
echo "(inventory: ${invent#${projectDir}/})"
echo "(playbook: ${pBook#${projectDir}/})"
echo "(ssh-key: ${privateKey#${projectDir}/})"

# Run play
cmdStr="ansible-playbook"
cmdStr="$cmdStr --private-key=$privateKey"
cmdStr="$cmdStr -u $pBookUser"
cmdStr="$cmdStr -i $invent"
cmdStr="$cmdStr $pBook"
eval $cmdStr

# ansible-playbook --private-key=.vagrant/machines/default/virtualbox/private_key \
# -u vagrant \
# -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
# playbook.yml


# cmdStr="ansible-playbook"
# cmdStr="$cmdStr --private-key=$privateKey"
# cmdStr="$cmdStr --user=$pBookUser"
# cmdStr="$cmdStr --connection=ssh"
# cmdStr="$cmdStr --limit='machine1'"
# cmdStr="$cmdStr --inventory-file=$invent"
# cmdStr="$cmdStr $pBook"
# eval $cmdStr

# ansible-playbook \
# --private-key=$privateKey \
# --user=$pBookUser \
# --connection=ssh \
# --limit='machine1' \
# #--inventory-file="$projectDir/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml" \
# # --inventory-file=$projectDir/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
# --inventory=$invent \
# $pBook

