### Update GCC 
Short Version - as su/root
```
root# emerge sync
root# emerge -u sys-devel/gcc
root# gcc-config -l
```
Select your new version from the list
```
root# gcc-config 2 
```
Use the new env and clean-up your box
```
root# env-update && source /etc/profile
root# emerge --oneshot libtool
root# revdep-rebuild
```
Check new version
```
root# gcc --version
root# emerge -C =sys-devel/gcc-4.8.4
```
have fun with your new c++ compiler
