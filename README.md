# config-setup
Repo containing config dotfiles for various different things in Ubuntu so that I can sync between my devices

Should also contain bash scripts and Ansible playbooks for setting everything up



### Notes Area/Handy Commands

Test whether a file exists or not (use -d for directory)

```
test -f /home/dennis/Coding/box.py && echo "exists."
```

Compile options

```
-Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Werror
```

Convert code to pdfs

```
find . -name "*.cpp" -o -name "*.h" | sort | xargs enscript --color=1 -C -Ecpp -fCourier8 -o - | ps2pdf - code.pdf
```