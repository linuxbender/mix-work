### emerge

bad-boy way to update the full gentoo linux box
```
root# emerge --update --deep --with-bdeps=y --newuse @world
```
this take a while.. :-P

metapackages clean up
```
root# emerge --update --deep --newuse @world
root# emerge --depclean
root# revdep-rebuild
```
