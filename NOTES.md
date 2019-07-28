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

References
----------

1. [Ansible Docs: Vagrant Guide][01]
2. [Vagrant Docs: Common Ansible Options][02]
3. [Some ideas at kewlfft/ansible-desktop][03]

[01]: https://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html "Ansible Docs: Vagrant Guide"
[02]: https://www.vagrantup.com/docs/provisioning/ansible_common.html#host_vars "Vagrant Docs: Common Ansible Options"
[03]: https://github.com/cdown/ansible-desktop "Some ideas at kewlfft/ansible-desktop"