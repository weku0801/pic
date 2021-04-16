#!/bin/bash

# SELINUX & Firewalld
systemctl disable --now firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# YUM
sed -i  's-gpgcheck=1-gpgcheck=0-g' /etc/yum.conf
mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*repo /etc/yum.repos.d/bak
cat << UK > /etc/yum.repos.d/wuke.repo
[tsinghua_base]
name=tsinghua_base
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/7/os/x86_64/
gpgcheck=0
enabled=0


[tsinghua_updates]
name=tsinghua_updates
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/7/updates/x86_64/
gpgcheck=0
enabled=0

[tsinghua_extras]
name=tsinghua_extras
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/7/extras/x86_64/
gpgcheck=0
enabled=0

[tsinghua_epel]
name=tsinghua_epel
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/x86_64
gpgcheck=0
enabled=0

[tsinghua_docker]
name=tsinghua_docker
baseurl=https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/7/x86_64/stable
gpgcheck=0
enabled=0

[tsinghua_kubernetes]
name=tsinghua_kubernetes
baseurl=https://mirrors.tuna.tsinghua.edu.cn/kubernetes/yum/repos/kubernetes-el7-x86_64
gpgcheck=0
enabled=1

[huawei_base]
name=huawei_base
baseurl=https://repo.huaweicloud.com/centos/7/os/x86_64/
gpgcheck=0
enabled=1

[huawei_updates]
name=huawei_updates
baseurl=https://repo.huaweicloud.com/centos/7/updates/x86_64/
gpgcheck=0
enabled=1

[huawei_extras]
name=huawei_extras
baseurl=https://repo.huaweicloud.com/centos/7/extras/x86_64/
gpgcheck=0
enabled=1

[huawei_epel]
name=huawei_epel
baseurl=https://repo.huaweicloud.com/epel/7/x86_64/
gpgcheck=0
enabled=1

[huawei_docker]
name=huawei_docker
baseurl=https://repo.huaweicloud.com/docker-ce/linux/centos/7/x86_64/stable/
#baseurl=https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/7/x86_64/stable
gpgcheck=0
enabled=1

[huawei_kubernetes]
name=huawei_kubernetes
baseurl=https://repo.huaweicloud.com/kubernetes/yum/repos/kubernetes-el7-x86_64
gpgcheck=0
enabled=0
UK
yum clean all
yum makecache fast

yum install git zsh bash-completion wget unzip tree tmux vim sysstat -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions kubectl z sudo docker helm/g' ~/.zshrc
echo 'DISABLE_AUTO_UPDATE="true"' >> ~/.zshrc
echo 'HIST_STAMPS="yyyy-mm-dd"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc

chsh -s $(which zsh)
`which zsh`
