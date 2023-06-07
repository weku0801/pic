#!/bin/bash

# SELINUX & Firewalld
systemctl disable --now firewalld
grubby --update-kernel=ALL --args="selinux=0 ipv6.disable=1"

# YUM
sed -i  's-gpgcheck=1-gpgcheck=0-g' /etc/yum.conf
mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*repo /etc/yum.repos.d/bak
cat << UK > /etc/yum.repos.d/wuke.repo
[aliyun-baseos]
name=aliyun-baseos
baseurl=https://mirrors.aliyun.com/rockylinux/9/BaseOS/x86_64/os/
gpgcheck=0
enabled=1
countme=1

[aliyun-appstream]
name=aliyun-appstream
baseurl=https://mirrors.aliyun.com/rockylinux/9/AppStream/x86_64/os/
gpgcheck=0
enabled=1
countme=1

[aliyun-extras]
name=aliyun-extras
baseurl=https://mirrors.aliyun.com/rockylinux/9/extras/x86_64/os/
gpgcheck=0
enabled=1
countme=1


[huawei_epel]
name=huawei_epel
baseurl=https://repo.huaweicloud.com/epel/9/Everything/x86_64/
gpgcheck=0
enabled=1

[huawei_docker]
name=huawei_docker
baseurl=https://repo.huaweicloud.com/docker-ce/linux/centos/9/x86_64/stable/
#baseurl=https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/7/x86_64/stable
gpgcheck=0
enabled=1

# [huawei_kubernetes]
# name=huawei_kubernetes
# baseurl=https://repo.huaweicloud.com/kubernetes/yum/repos/kubernetes-el7-x86_64
# gpgcheck=0
# enabled=0

# [aliyun_kubernetes]
# name=aliyun_kubernetes
# baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
# gpgcheck=0
# enabled=1
UK
dnf clean all
dnf makecache fast

dnf install git zsh bash-completion tar wget unzip tree tmux vim -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions sudo/g' ~/.zshrc
# sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions kubectl sudo docker helm/g' ~/.zshrc

echo 'zstyle ':omz:update' mode auto' >> ~/.zshrc
echo 'HIST_STAMPS="yyyy-mm-dd"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc
