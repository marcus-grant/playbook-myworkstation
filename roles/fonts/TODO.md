To-Do's
=======

In-Progress
-----------

- [ ] Test that when the role is published and installed with galaxy it does synchronize file path correctly
- [ ] make a special nerd font handler that allows use of end of url name before zip ext
- [ ] Improve defaults for publishing

Planning
--------

- [ ] This role needs significant refactoring


Future
------

- [ ] download fonts using aur
- [ ] Figure out a good way to test this
- [ ] Do better handling of OS specific default vars that can be overriden
    - something like [this](https://stackoverflow.com/questions/41189336/define-ansible-variable-in-a-role-with-os-specific-default-which-can-be-easily-o#41193233)
- [ ] Come up with section that handles copying files from ansible controller

Completed
---------

- [x] download fonts as tarballs (nerd font)
- [x] download fonts using pacman