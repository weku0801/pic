#!/bin/bash

# apt
sudo mv /etc/apt/sources.list{,.bak}

sudo bash -c 'cat << UK > /etc/apt/sources.list
# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to newer versions of the distribution.
deb http://repo.huaweicloud.com/ubuntu bionic main restricted
deb http://repo.huaweicloud.com/ubuntu bionic-updates main restricted

deb http://repo.huaweicloud.com/ubuntu bionic universe
deb http://repo.huaweicloud.com/ubuntu bionic-updates universe

deb http://repo.huaweicloud.com/ubuntu bionic multiverse
deb http://repo.huaweicloud.com/ubuntu bionic-updates multiverse

deb http://repo.huaweicloud.com/ubuntu bionic-backports main restricted universe multiverse
deb http://repo.huaweicloud.com/ubuntu bionic-security main restricted
deb http://repo.huaweicloud.com/ubuntu bionic-security universe
deb http://repo.huaweicloud.com/ubuntu bionic-security multiverse
UK'

sudo timedatectl set-timezone Asia/Shanghai

sudo apt-get update

sudo apt install git zsh wget unzip tree tmux vim sysstat -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions kubectl sudo docker helm/g' ~/.zshrc
echo 'DISABLE_AUTO_UPDATE="true"' >> ~/.zshrc
echo 'HIST_STAMPS="yyyy-mm-dd"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc

sudo chsh -s /bin/zsh $USER
zsh