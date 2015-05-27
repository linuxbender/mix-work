# Sudo
Granting Permissions to the **wheel** group in your system
> edit sudo config files as su / root
```Bash
#!/bin/bash
root$ nano - w /etc/sudoers
```
> wheel group with emerge grant
```
%wheel  localhost = /usr/bin/emerge
```
> or for **all** admin grants
```
%wheel ALL=(ALL) ALL
```

# Sudo enhancements
Bash Completion add **Complete -cf sudo** to your bashrc (current user)
> The bashrc is to find under your home folder in your linux-box
```
user$ sudo echo "complete -cf sudo" >> $HOME/.bashrc
```
