## Docker.io

## Install on ubuntu mate 15.4 on virtualbox
### Terminal commands
Update packages for the system
> sudo apt-get update

Install kernel header for virtualbox kernel guest system
> sudo apt-get install build-essential linux-headers-$(uname -r) dkms

Run virtualbox guest system script for linux  (Host+D)
> sudo ./VBoxLinuxAddition.run

Reboot system
> sudo reboot

Install wget (crasy people)
> sudo apt-get install wget

Get the latest Docker package
> wget -qO- https://get.docker.com/ | sh

Add docker to the default runlevel (start deamon on boot)
> sudo update-rc.d docker defaults

Start deamon
> sudo service docker start

Basic test if Docker works with the *hello world* container
> sudo docker run hello-world

Create a docker groupe on your system and add your current user
> sudo usermod -aG docker docker

Setup Firewall (UFW) - check if is enabled
> sudo ufw status

If Not enable UFW
> sudo ufw enable

Edit UFW configuration in your text editor (vim or nanao..)
> sudo vim /etc/default/ufw

Set DEFAULT_FORWARD_POLICY to ACCEPT (default value in my case was *DROP*) 
>DEFAULT_FORWARD_POLICY="ACCEPT"

Save your changes and reload ufw
> sudo ufw reload

Add your incomming rule on the Docker port (*allow*)
> sudo ufw allow 2375/tcp


