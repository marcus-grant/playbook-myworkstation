To-Do's
=======

In-Progress
-----------

- [ ] NVM role for managing setup of dev environment for node and setting default node to lts

Planning
--------

- [ ] flatpak role to install flatpak and a variable set of apps
- [ ] change the psutil from cli-packages to go into the pyenv role?
- [ ] python env or python dev env role
- [ ] linux_gaming role
- [ ] install popOS & use gnome role to config it
    - consider [this](https://www.addictivetips.com/ubuntu-linux-tips/install-pop-gtk-theme-on-linux/)
- [ ] ansible update/sort mirrorlist for pacman by speed
    - consider [this](https://wiki.archlinux.org/index.php/Mirrors)

Future
------

- [ ] install pop_OS gtk theme using gnome role, probably with dconf aswell
- [ ] add aur response to failed extra package install
- [ ] Add usage section in README
- [ ] go-env role to setup proper golang setup with GOPATH in different path from projects & seperate bin for user than sys
- [ ] ansible/vagrant/vbox/libvirt dev role
- [ ] Configure i3 fonts (if in use) 
    - this will need planning because it might require integrations w/ i3 dots
- [ ] Bash dev env (linters, test runners, etc.)
- [ ] Timeshift task/role or some other rsync snapshotting utility for backups
    - This includes setting up pacman hooks & crond timetables
- [ ] ssh-hardening role (there's one that exists, investigate)
- [ ] git split out `my-common-packages` into its own role repo?
- [ ] bluetooth role with audio support
    - audio settings should probably be its own thing
- [ ] Antivirus role
- [ ] Creat run scripts for CI/CD pipeline
    - [ ] A proper test system that tests all roles excluding external ones
    - [ ] A linter command with thought out lint configs for yamllint, ansible lint, 

Completed
---------

- [x] Setup play/run/inventory for local system
- [x] Configure gnome fonts (if in use) using gconf
- [x] Install all the fonts you want both from regular package mgr and from nerd fonts
- [x] Separate task for installing a list of gui packages will be specific to host/group
- [x] Separate task for installing a list of shell packages will be specific to host/group
- [x] Common role for common package installs
- [x] Get vault working
- [x] Update prepare.yml to stop automatic suspend on VM
- [x] Get marcus-grant.arch-bootstrap role to work
- [x] Get vagrant test inventory to work