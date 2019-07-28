To-Do's
=======

In-Progress
-----------

- [ ] Separate task for installing a list of gui packages will be specific to host/group
- [ ] Install all the fonts you want both from regular package mgr and from nerd fonts
- [ ] Ensure tree is in the cli apps role
- [ ] cli apps role (includes fzf, ripgrep and fd) and a variable set of apps

Planning
--------

- [ ] Configure gnome fonts (if in use) using gconf
    - look at pop_OS for their font settings
- [ ] flatpak role to install flatpak and a variable set of apps
- [ ] NVM role for managing setup of dev environment for node and setting default node to lts
- [ ] Setup play/run/inventory for local system

Future
------

- [ ] Add usage section in README
- [ ] go-env role to setup proper golang setup with GOPATH in different path from projects & seperate bin for user than sys
- [ ] linux_gaming role
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

Completed
---------

- [x] Separate task for installing a list of shell packages will be specific to host/group
- [x] Common role for common package installs
- [x] Get vault working
- [x] Update prepare.yml to stop automatic suspend on VM
- [x] Get marcus-grant.arch-bootstrap role to work
- [x] Get vagrant test inventory to work