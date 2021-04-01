# config-setup
Repo containing config dotfiles for various different things in Ubuntu so that I can sync between my devices

Should also contain bash scripts and Ansible playbooks for setting everything up



### Notes Area/Handy Commands

Test whether a file exists or not (use -d for directory)

```
test -f /home/dennis/Coding/box.py && echo "exists."
```

Find a file

```
sudo find / -iname "*logid*" 
```

Compile options

```
-Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Werror
```

Convert code to pdfs

```
find . -name "*.cpp" -o -name "*.h" | sort | xargs enscript --color=1 -C -Ecpp -fCourier8 -o - | ps2pdf - code.pdf
```

What is stored in each root folder:

``` bin for binary: the place where the most essential commands are stored
boot: there are files related to the system's operation at startup,

dev: special directory corresponding to the devices of the system, e.g. disks, terminal, mouse keyboard

etc: directory with administrative information associated with the system.

home: contains the private files of the users.

lib for library: maintains data files associated with various commands.

lost and found: special directory that is used during disk maintenance to store files that are found without proper linkage to other directories.

mnt for mount: used for mounting external storage devices, such as USB flash drives.

proc: contains information about the system

sbin for system binaries: stores essential files used by the system administrator.

tmp: gathers the temporary files of the system, particularly files that are used and then get deleted.

usr for user: is used for storing additional commands in libraries, that are not essential for booting up the system (contains some common directories with root dir)

var for variable: contains files that vary during the system's runtime, such as log files and mail files.```
```

## TODO:

Use an alias for simple one line commands (e.g. google drive sync)

Setup nvim with intellisense of autocomplete