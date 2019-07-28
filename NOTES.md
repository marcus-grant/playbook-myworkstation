Notes on Developing Workstation Playbook
========================================

Vagrant Test Instance
---------------------

First create the `Vagrantfile`

```ruby
Vagrant.require_version ">= 2.0.0"

Vagrant.configure(2) do |config|
    # config.vm.box = "vagrant-manjaro_gnome_18-base-v1.2"
    # config.vm.box = "austinbutler/archlinux-gui-x86_64"
    config.vm.box = "archlinux-gnome"
    # config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.cpus = 2
        v.memory = 4096
        v.gui = true
        v.name = "test-workstation"
    end
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "tests/prepare.yml"
        # ansible.inventory_path = "inventories/test-workstation/hosts"
    end
end
```

- Took the `austinbutler/archlinux-gui-x86_64` box to start with
- Then ran the preparation provisioner script in `tests/prepare.yml`
    - This just does the standard ensure python is installed task & upgrades the packages
- This box was then repacked by running `vagrant package` in project directory, moved & re-added to vagrant
    - This avoids having to do lengthy `vagrant up` commands and wasting bandwidth
    - It got renamed to "arclinux-gnome"
- `v.name` renames the instance
    - this renaming makes it recognize host vars of name `test-workstation`?
- There's a lot of details in the [ansible][01] & [vagrant][02]

Easy Commands
-------------

The directory `./run` has organized commands that run various useful scripts. This includes complex ones like running a playbook against a running vagrant box. This is better than provisioning a complete playbook on every run because it's faster to just rerun the playbook when making changes to test out.

The directory looks like this (now):

```sh
tree run
run
├── local
│   └── local_play.sh
└── test
    ├── play.sh
    └── up.sh
```

Each directory specifies a run condition like running a test or running a script locally.

Required Roles
--------------

I'm trying to develop more roles. This means separating them into their own project directories and publishing them on github/galaxy. `./requirements.yml` allows an easy `ansible-galaxy` command to install them to this project. This is an example of what `requirements.yml` looks like:

```yaml
---
- name: marcus-grant.bootstrap-ansible-arch
  src: https://github.com/marcus-grant/role-bootstrap-ansible-arch
  version: master
- name: marcus-grant.mydotfiles
  src: https://github.com/marcus-grant/role-mydotfiles
  version: master
```

Then run `ansible-galaxy install -r requirements.yml` makes sure the up-to-date version is present and available for local use, using the names given.

Valuts Are Good for Secrets
---------------------------

I prefer to encrypt entire files in vaults instead of storing them as encrypted strings in variable files. That way, not only can I encrypt the contents en-masse, but it's possible to have git ignore the files entirely adding an extra layer of accident proofing that would lead to posting passwords and keys online.

### Create a Vault File

Ansible's `ansible-vault` is the installed utility to deal with encrypted files and strings inside files. The `create` sub-command allows for creating encrypted files.

```sh
ansible-vault create group_vars/vault.yml
```

This will do two things:

1. Prompt for a password that unlocks the vault file to be read or modified
2. Bring up the default editor command stored in environment variable `EDITOR` to edit the vault fault, in my case it's `vim`

### Make Sure Git Ignores Vault Files

All vault files are going to have the word `vault` in the filename, so make sure git isn't tracking any `vault` file in a `.gitignore` file.

```
# ...other ignores
*vault*
```

### Adding a Password Key File to Unlock the Vault

To make it easier to use ansible commands that require passwords, create a local file **OUTSIDE THE PROJECT DIRECTORY** that contains the password string that unlocks the vault. Pick a place, just make sure it's memorable and put either a random string or a new password that will be remembered, which might be good if multiple machines will manage playbooks. 

To create a password file with a remembered password, just create a file of any name and place it somewhere memorable in the filesystem, or in another filesystem and enter only the password string into it. To create a random string use the `openssl rand` command to generate a random string and pipe it into a file:

```sh
echo "$(openssl rand -base64 48)" > /some/location/on/a/filesystem
```

To re-key a vault file, just use the old password, the new one (or the file) and use this `ansible-vault` subcommand `rekey`.

```sh
ansible-vault rekey \
--new-vault-password-file=/some/location \
--vault-password-file=/other/location
./group_vars/vault.yml
```

It's recommended to re-key password files every once in a while and if an old password file was used to key the current vault the `--vault-password-file=` option allows decrypting the vault before rekey to a new password file.

### Using Variables from Vaults

Now the vault information has to actually be usable, otherwise why use it. Two common locations are useful for vault variables:

1. Inventory files
    - `ansible_ssh_pass='{{ vault_var_for_ssh_passwd }}'`
    - `ansible_become_pass='{{ vault_var_for_privelege_escalation }}'`
2. Plays to pass passwords to roles & tasks
    - `include_vars: ./group_vars/vault.yml`
    - useful for using passwords/keys on installed apps/services on remote

### Viewing and Editing Vaults

To view a vault file just use: `ansible-vault view group_vars/vault.yml` to see what variables are already put in the vault file, printed out in the terminal.

To edit it, just use `ansible-vault edit`.


References
----------

1. [Ansible Docs: Vagrant Guide][01]
2. [Vagrant Docs: Common Ansible Options][02]
3. [Some ideas at kewlfft/ansible-desktop][03]

[01]: https://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html "Ansible Docs: Vagrant Guide"
[02]: https://www.vagrantup.com/docs/provisioning/ansible_common.html#host_vars "Vagrant Docs: Common Ansible Options"
[03]: https://github.com/cdown/ansible-desktop "Some ideas at kewlfft/ansible-desktop"