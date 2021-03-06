# Ansible Arch-Family Workstation Playbook

## Summary

> **Note**, this is a highly personal set of customizations that work for me. With all sensitive information handled in a completely seperate software stack so don't bother trying to find them here. Although I try and make my personal playbooks somewhat flexible to future changes because that benefits me in reducing development time, I urge you to use this as a template for your own ideas instead of directly cloning and running this. It will change your system in sometimes undesirable ways, *such as remapping caps lock and right alt keys*, setting undervolting profiles for my CPUs, and other changes specific to my needs that can be hard to revert without understanding how these specific hacks work. But you are certainly free to do so understanding that I take no responsibility for the changes it does to your system.

This is a repository for my personal playbook that I run to provision machines that act as my workstations. This includes a desktop and two laptops. Right now they're all either Arch, Debian Testing, or Pop_OS! (Ubuntu with better hardware compatibility and design choices). I'm considering adding an ARM Macbook to the mix in the very near future depending on how Apple handles homebrew with their ARM CPUs. Here's an issue tracker thread over at [homebrew](https://github.com/Homebrew/brew/issues/7857) concerned with how the ARM transition will affect them.

## Usage

This is currently made for both MacOS and Linux based systems.

### MacOS

1. Clone the repository to where you keep your ansible playbooks or any kind of system admin area of your drive.

2. Run the `init.sh` script in the root of the playbook directory just cloned.

3. Run the command `ansible-galaxy install -r requirements.yml` to install all the needed ansible roles.

### TODO

## Roles

- [marcus-grant/bootstrap-ansible-arch](https://github.com/marcus-grant/role-bootstrap-ansible-arch)
  - Used to bootstrap arch installations to be controlled by ansible
  - Also makes it possible to use AUR in tasks as an ansible module
  - Installs some basic packages to make `makepkg` work
- [marcus-grant/role-mydotfiles](https://github.com/marcus-grant/role-mydotfiles)
  - A highly customizable role that clones repositories with dotfiles, and links them to the right places
  - Works for multiple dotfile repositories with configurable root dotfile directory and symlink definitions
