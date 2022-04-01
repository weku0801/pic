#!/bin/bash

sudo timedatectl set-timezone Asia/Shanghai

curl -fsSL https://repo.huaweicloud.com/docker-ce/linux/debian/gpg | sudo apt-key add -
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

mv /etc/apt/sources.list{,.bak}
sudo bash -c 'cat < UK > /etc/apt/sources.list
deb http://repo.huaweicloud.com/ubuntu focal main restricted
deb http://repo.huaweicloud.com/ubuntu focal-updates main restricted
deb http://repo.huaweicloud.com/ubuntu focal universe
deb http://repo.huaweicloud.com/ubuntu focal-updates universe
deb http://repo.huaweicloud.com/ubuntu focal multiverse
deb http://repo.huaweicloud.com/ubuntu focal-updates multiverse
deb http://repo.huaweicloud.com/ubuntu focal-backports main restricted universe multiverse
deb http://repo.huaweicloud.com/ubuntu focal-security main restricted
deb http://repo.huaweicloud.com/ubuntu focal-security universe
deb http://repo.huaweicloud.com/ubuntu focal-security multiverse
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu focal stable
UK'

apt install git zsh bash-completion wget unzip tree tmux vim sysstat -y

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions sudo/g' ~/.zshrc
# sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions kubectl sudo docker helm/g' ~/.zshrc

echo 'zstyle ':omz:update' mode auto' >> ~/.zshrc
echo 'HIST_STAMPS="yyyy-mm-dd"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc