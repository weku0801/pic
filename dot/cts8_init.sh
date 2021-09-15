#!/bin/bash

# SELINUX & Firewalld
systemctl disable --now firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# YUM
sed -i  's-gpgcheck=1-gpgcheck=0-g' /etc/yum.conf
mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*repo /etc/yum.repos.d/bak
cat << UK > /etc/yum.repos.d/wuke.repo
[huawei_baseos]
name=huawei_baseos
baseurl=https://repo.huaweicloud.com/centos/8/BaseOS/x86_64/os/
enabled=1
gpgcheck=0
gpgkey=https://repo.huaweicloud.com/centos/RPM-GPG-KEY-CentOS-Official

#released updates
[huawei_appstream]
name=huawei_appstream
baseurl=https://repo.huaweicloud.com/centos/8/AppStream/x86_64/os/
enabled=1
gpgcheck=0
gpgkey=https://repo.huaweicloud.com/centos/RPM-GPG-KEY-CentOS-Official

[huawei_powertools]
name=huawei_powertools
baseurl=https://repo.huaweicloud.com/centos/8/PowerTools/x86_64/os/
enabled=1
gpgcheck=0
gpgkey=https://repo.huaweicloud.com/centos/RPM-GPG-KEY-CentOS-Official


#additional packages that may be useful
[huawei_extras]
name=huawei_extras
baseurl=https://repo.huaweicloud.com/centos/8/extras/x86_64/os/
enabled=1
gpgcheck=0
gpgkey=https://repo.huaweicloud.com/centos/RPM-GPG-KEY-CentOS-Official


#additional packages that extend functionality of existing packages
[huawei_centosplus]
name=huawei_centosplus
baseurl=https://repo.huaweicloud.com/centos/8/centosplus/x86_64/os/
enabled=1
gpgcheck=0
gpgkey=https://repo.huaweicloud.com/centos/RPM-GPG-KEY-CentOS-Official


[huawei_epel]
name=huawei_epel
baseurl=https://repo.huaweicloud.com/epel/8/Everything/x86_64/
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[huawei_epel_modular]
name=huawei_epel_modular
baseurl=https://repo.huaweicloud.com/epel/8/Modular/x86_64/
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[huawei_docker]
name=huawei_docker
baseurl=https://repo.huaweicloud.com/docker-ce/linux/centos/8/x86_64/stable/
#baseurl=https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/8/x86_64/stable
enabled=1
gpgcheck=0

UK
dnf clean all
dnf makecache timer

dnf install git zsh bash-completion wget unzip tree tmux vim sysstat  -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions kubectl sudo docker helm/g' ~/.zshrc
echo 'DISABLE_AUTO_UPDATE="true"' >> ~/.zshrc
echo 'HIST_STAMPS="yyyy-mm-dd"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc

sed -i 's#root:/bin/bash#root:/bin/zsh#g' /etc/passwd
