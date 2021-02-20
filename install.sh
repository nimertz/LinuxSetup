#!/bin/sh
# Please execute from ~/
# requires flatpak, apt and snap
# Heavily based on https://github.com/erik1066/pop-os-setup

# latest security updates
sudo apt update && sudo apt dist-upgrade -y

# Install useful applications:
sudo apt-get install -y alacritty
sudo apt-get install -y gnome-tweaks
sudo apt-get install -y code
sudo apt-get install -y htop
flatpak install postman
flatpak install vlc
flatpak install spotify

# install common development tools:
sudo apt install \
openjdk-8-jdk-headless \
maven \
build-essential \
apt-transport-https \
ca-certificates \
curl \
software-properties-common \
apache2-utils \
make \
chromium-browser \
gnome-tweak-tool \
gnome-shell-extensions \
python3-pip \
dconf-editor \
libgconf-2-4

# Install fish shell with oh-my-fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish -y
curl -L https://get.oh-my.fish | fish

# Install font and theme for fish terminal
sudo apt-get install fonts-powerline
omf install bobthefish

# Install guake dropdown terminal --> guake preferences --> configure theme, font, key shortcut etc.
sudo apt-get install guake -y



# Install .NET Core
sudo apt install apt-transport-https ca-certificates
cd ~/Downloads
wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update && sudo apt install dotnet-sdk-5.0 -y
rm -f packages-microsoft-prod.deb

# Install Docker and Docker Compose
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Running "sudo apt-key fingerprint 0EBFCD88" should display:

# pub   rsa4096 2017-02-22 [SCEA]
#       9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
# sub   rsa4096 2017-02-22 [S]

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
docker --version

# Running "docker --version" should display "Docker version 19.03.12, build 48a66213fe" or newer

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Running "docker-compose --version" should display "docker-compose version 1.28.2, build 67630359"

sudo usermod -aG docker $USER

# Restart the machine for this to take effect

# Install python wrapper
sudo apt install -y swig

# Install python3.6.9 - https://towardsdatascience.com/building-python-from-source-on-ubuntu-20-04-2ed29eec152b
sudo apt-get update
sudo apt-get install -y build-essential checkinstall 
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
cd Downloads
sudo wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
sudo tar xzf Python-3.6.9.tgz
cd Python-3.6.9
sudo ./configure --enable-optimizations
sudo make altinstall

# Install latest CMake
sudo snap install cmake --classic

# Install VTune - https://software.intel.com/content/www/us/en/develop/articles/installing-intel-oneapi-toolkits-via-apt.html

# Virtual Box and Vagrant
sudo apt-get install virtualbox virtualbox-ext-pack
wget -c https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.deb
sudo dpkg -i vagrant_2.2.14_x86_64.deb
vagrant plugin install vagrant-digitalocean

# Install touchpad gestures

