## Setup nodejs on mac and linux
In my case I use *NVM* like *RVM* from the ruby world, for this you need no Root Access.
It will run unter your user profile :-) sweet

### Install Node Version Manager (mac and linux)
You need access to the internet. Git, curl or wget shoud installed on your box.

Install NVM
> curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

Reload your env
> source ~/.bashrc

Basic Test
> nvm
Install NodeJs (in my case 0.12.4 or stable)
> nvm install -s stable

Use the new version
> nvm use stable

Set as default in your profile env
> nvm alias default stable

Delete/uninstall *NVM*, just remove ~/.nvm, ~/.npm, and ~/.bower folders in your user profile :-)

More information on:
[nvm] (https://github.com/creationix/nvm)



