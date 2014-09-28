
Nodejs and Macbook Pro
=========
### How to install NodeJs and NPM on a Macbook Pro
In this version you don't need to install with Sudo permissions.
```bash
echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
. ~/.bashrc
mkdir ~/local
mkdir ~/node-latest-install
cd ~/node-latest-install
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
./configure --prefix=~/local
make install # ok, fine, this step probably takes more than 30 seconds...
curl https://www.npmjs.org/install.sh | sh
```
>**Info:** First create a .bashrc file in your home directory

> **Uninstall:** Just Delete your folders in your home directory. 

List of install methods: [Nodejs Install ](https://gist.github.com/isaacs/579814#file-yet-another-option-sh)
###  How to remove original Nodejs installations
**First Step:**
```bash
npm ls -gp | awk -F/ '/node_modules/ && !/node_modules.*node_modules/ {print $NF}' | xargs npm -g rm
```
**Sec Step:**
```bash
sudo rm -rf /usr/local/lib/node \
     /usr/local/lib/node_modules \
     /var/db/receipts/org.nodejs.*
```