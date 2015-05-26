# Update GCC 
## Short Version
```
root# emerge -u sys-devel/gcc
root# gcc-config -l
```
Select your new version from the list
```
root# gcc-config 2 
```
use new env and clean up system
```
root #env-update && source /etc/profile
root #emerge --oneshot libtool
revdep-rebuild
```
Check new version
```
root #gcc --version
root #emerge -C =sys-devel/gcc-4.8.4
```
have fun with your new c++ compiler
