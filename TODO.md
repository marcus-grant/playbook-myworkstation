To-Do's
=======

In-Progress
-----------

- [ ] handler or followup for dotfiles where profile with new env vars are updated
- [ ] fix tags argument to run only singly tagged playbooks
- [-] ASDF role with subtasks for installing all dev environments
  - [x] ASDF Tool install
  - [x] node install
  - [ ] python install
  - [ ] deno
  - [ ] postgres
  - [ ] IF problems arise with installs of asdf-node + using yarn, add tasks using this [fix](https://github.com/asdf-vm/asdf-nodejs/issues/42#issuecomment-360884173)
- [ ] Check up on this problem which happens with undervolt role's systemd module tasks & handlers
  - <https://github.com/ansible/ansible/issues/71528>
- [ ] Refactor cli, gui packages to roles, a role for...
  - all these have overrides
  - [ ] common-cli
  - [ ] common-gui
  - [ ] extra-cli
  - [ ] extra-gui
  - [ ] flatpacks
- [ ] Fix security alerts: <https://github.com/marcus-grant/playbook-myworkstation/network/alerts>
- [ ] boostsrap.sh to install core utilities, ansible & its deps
- [ ] fix tag running scripts to not include other roles
- [ ] Better firefox scrolling using [these][02] settings in `~/.mozilla/firefox/yourprofile/user.js`
- [ ] Finish fonts role with a remote storage location for all fonts
  - There's a good example of what can be done [here][nvmsh]
- [ ] ActivityWatch Install, here's [docs][01]
- [ ] Add default link var for neovim's `coc-settings.json` location added to repo
- [ ] Add role/task to install [gnome gestures util](https://gitlab.com/cunidev/gestures)
- [ ] Keyboard shortcuts tasks for gnome role
- [ ] Virtual workspace up/down super + pg up / pg down
- [ ] Virtual workspace by number super + 1,2,3...

Planning
--------

- [ ] Run ansible lint and clean all errors
- [ ] Refactored run scripts making use of makefiles
  - [Example][env-automation-makefile] of a workstation playbook using makefiles
  - [Explanation][env-automation-blogpost] of how this workflow could be run at start of any new system or with any new changes by making use of ansible tags, and make systems of the host
- [ ] ASDF role with subtasks for installing all dev environments
  - [ ] refactor to use `tool-versions` config file to install everything instead, easier to automate with templates
  - [ ] fzf
  - [ ] fd
  - [ ] rust
  - [ ] .net core
- [ ] undervolting using [amdctl][amdundervolt]
- [ ] NVM role for managing setup of dev environment for node and setting default node to lts
- [ ] Guake
  - [ ] Install Guake on...
    - [ ] Arch
    - [ ] Aptitude Based
    - [ ] Yum based
  - [ ] Configure `Ctrl+/` to perform neovim sequence `?/#` used as hack to toggle line comments like most editors
    - Same thing gets done in alacritty for reference
  - [ ] Confugre it to have theme variables to match larger gnome role theme, (esp. if using pop-gtk, pop-shell)
- [ ] make sure `bash-completion` is installed on arch/manjaro workstations
- [ ] flatpak role to install flatpak and a variable set of apps
- [ ] NVM role for managing setup of dev environment for node and setting default node to lts
- [ ] change the psutil from cli-packages to go into the pyenv role?
- [ ] python env or python dev env role
- [ ] linux_gaming role
- [ ] Add check to bootstrap role that checks for aur module installed via local aur
  - ie somewhere in usr not home
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
- [ ] install popOS & use gnome role to config it
  - consider [this](https://www.addictivetips.com/ubuntu-linux-tips/install-pop-gtk-theme-on-linux/)
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

- [x] undervolting role with systemd file
- [x] Add ansible-galaxy install requirements check into local run script
- [x] Update cli_packages to include xclip, since it's removed from common-packages role
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

[nvmsh]: https://github.com/nvm-sh/nvm
[env-automation-makefile]: https://github.com/alehatsman/env-automation/blob/master/Makefile "Github: alehatsman/env-automation/master/Makefile"
[env-automation-blogpost]: https://alehatsman.com/posts/dotfiles_and_configuration_management_using_ansible.html "alehatsman blog: automating dotfiles with ansible"
[amdundervolt]: https://github.com/kevinlekiller/amdctl/issues/18 "Github: kevinlekiller/amdctl"

[01]: https://docs.activitywatch.net/en/latest/getting-started.html "ActivityWatch Docs: Getting Started"
[02]: https://wiki.archlinux.org/index.php/Firefox#Smooth_Scrolling "Arch Wiki: Firefox - Smooth Scroll"
