Ansible Arch-Family Workstation Playbook
========================================

Summary
-------

This is a repository for my personal playbook that I run to provision machines that act as my workstations. This includes a desktop and two laptops. Right now they're all either Arch or Manjaro Linux machines, but I'm considering a transition to Debian at some point so I will probably be updating it at some point to work for Debian. And I might use it to provision my rarely used mac mini, which is just running as a debian server at the moment.

You're more than welcome to use the playbook yourself, but I warn you it's likely **highly** personalized so all of my roles, variables and tasks aren't necessarily optimized for generic reuse. I recommend forking or looking over the playbook and taking what looks best for your own uses.

Usage
-----

### TODO

Roles
-----

- [marcus-grant/bootstrap-ansible-arch](https://github.com/marcus-grant/role-bootstrap-ansible-arch)
    - Used to bootstrap arch installations to be controlled by ansible
    - Also makes it possible to use AUR in tasks as an ansible module
    - Installs some basic packages to make `makepkg` work
- [marcus-grant/role-mydotfiles](https://github.com/marcus-grant/role-mydotfiles)
    - A highly customizable role that clones repositories with dotfiles, and links them to the right places
    - Works for multiple dotfile repositories with configurable root dotfile directory and symlink definitions