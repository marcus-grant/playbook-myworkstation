To-Do's
=======

In-Progress
-----------

- [ ] Get marcus-grant.arch-bootstrap role to work
- [ ] Update prepare.yml to stop automatic suspend on VM
- [ ] Get vault working

Planning
--------

- [ ] Common role for common package installs

Future
------

- [ ] Install all the fonts you want both from regular package mgr and from nerd fonts
- [ ] Ensure tree is in the cli apps role
- [ ] cli apps role (includes fzf, ripgrep and fd) and a variable set of apps
- [ ] Add usage section in README
- [ ] Configure gnome fonts (if in use) using gconf
    - look at pop_OS for their font settings
- [ ] flatpak role to install flatpak and a variable set of apps
- [ ] NVM role for managing setup of dev environment for node and setting default node to lts
- [ ] go-env role to setup proper golang setup with GOPATH in different path from projects & seperate bin for user than sys
- [ ] linux_gaming role
- [ ] ansible/vagrant/vbox/libvirt dev role
- [ ] Configure i3 fonts (if in use) 
    - this will need planning because it might require integrations w/ i3 dots
- [ ] Bash dev env (linters, test runners, etc.)
- [ ] Timeshift task/role or some other rsync snapshotting utility for backups
    - This includes setting up pacman hooks & crond timetables
- [ ] ssh-hardening role (there's one that exists, investigate)

Completed
---------

- [x] Get vagrant test inventory to work