#!/bin/bash

cat > /root/.ssh/authorized_keys <<UK
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCikWm0DPzGXKpIlHLLIWQE3lvyK4iYnGqasZTW5JoshI3D7lN26E+DJWRAi4jQ4RxadQAWLXQx4kWQFzam39NqGkGsyOVIk6m7uHKaBKiBRGExi1SGt/5JytMVPZbFHXyHJOQisnhCo1FcR/HIxSDyqyLL5X520ZtRKX6rUifIrrFDaC/Sd9UzgqI0BKsN+Aol2a6+iUAtYEsoQv1p5oiOEDX+BP5ljnoeDv5TcJ09v0SgSF4AQpfeD1bItc7qeaipI+3Kl1dVQjmU/6OIHPn5ZOYk+UCxZmjkDtzR+mrGYudlSafzOAICdVEGlFpHV+f7cFK8TKWT/skElbpfTyaJ3aCD40QyRW1kf1g7KDuIGuvFOOVt9wyxWrKWdCZxRxu424KCvoOg6D4USPGVMk9NFSK4DYyLdnGvVnQtNqesSsFOcgw1fmTMMUBwfzd/5BLsLH7ZFqKiLc8LsiqlU/NKp7WcdJb8FXAAEcEregazGemLoTBHhEjBesGZUpHiCgM= uk@uk
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRmiOhaAPgXnC+S43eqJY1h72XlBkx5NcQeVdjA0UaFrpANz5COFnZjPFUYy3frgqU9755CFr7BynhxGTIKooOqhZcg/co16b1Lc1a0qth7gs4ERMeF9ZzGQV8L8bVIdyUkqPsKHeLuzAwd4cLzPD1/hiPdj69/m61OZV4GqXPgAB0M7W63vooBidCbvHiflsQVMV6JXPb7LfqZM0jSYh4gQMR/Pu+r3FuMahQbCgNVGRJU4mlUyusuRqp60W+egQ9t3Gu/18U27HlWBqmDCeZOnP1lGchcI62XiDq1jl3Ad6CkxGisFXb5+JnM4IM8PgE4hibEvtcVegI7ucbNo37oVRajuDCKJ+z/b++mznJxt13PmtYCEX2xz36IjL4VVVbV0e3nj1w7jSix/RJbFEgA2YY9xGKhoajBC0w17Lw2mnov6jBwCwq5V6g+3jn+Pm6bRpV6pXGCXWsN54Pe/VDDbjvRAi3aIRkNlUMxDIAaMmwjNxr7Hwdu3Pw9q3lhns= uk@uk
UK

cat > /root/.ssh/id_rsa.pub <<UK
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRmiOhaAPgXnC+S43eqJY1h72XlBkx5NcQeVdjA0UaFrpANz5COFnZjPFUYy3frgqU9755CFr7BynhxGTIKooOqhZcg/co16b1Lc1a0qth7gs4ERMeF9ZzGQV8L8bVIdyUkqPsKHeLuzAwd4cLzPD1/hiPdj69/m61OZV4GqXPgAB0M7W63vooBidCbvHiflsQVMV6JXPb7LfqZM0jSYh4gQMR/Pu+r3FuMahQbCgNVGRJU4mlUyusuRqp60W+egQ9t3Gu/18U27HlWBqmDCeZOnP1lGchcI62XiDq1jl3Ad6CkxGisFXb5+JnM4IM8PgE4hibEvtcVegI7ucbNo37oVRajuDCKJ+z/b++mznJxt13PmtYCEX2xz36IjL4VVVbV0e3nj1w7jSix/RJbFEgA2YY9xGKhoajBC0w17Lw2mnov6jBwCwq5V6g+3jn+Pm6bRpV6pXGCXWsN54Pe/VDDbjvRAi3aIRkNlUMxDIAaMmwjNxr7Hwdu3Pw9q3lhns= uk@uk
UK

cat > /root/.ssh/id_rsa <<UK
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----
UK
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub

# SELINUX & Firewalld
systemctl disable --now firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# YUM
sed -i  's-gpgcheck=1-gpgcheck=0-g' /etc/yum.conf
mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*repo /etc/yum.repos.d/bak
cat << UK > /etc/yum.repos.d/wuke.repo
# [tsinghua_base]
# name=tsinghua_base
# baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/7/os/x86_64/
# gpgcheck=0
# enabled=0

# [tsinghua_updates]
# name=tsinghua_updates
# baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/7/updates/x86_64/
# gpgcheck=0
# enabled=0

# [tsinghua_extras]
# name=tsinghua_extras
# baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/7/extras/x86_64/
# gpgcheck=0
# enabled=0

# [tsinghua_epel]
# name=tsinghua_epel
# baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/7/x86_64
# gpgcheck=0
# enabled=0

# [tsinghua_docker]
# name=tsinghua_docker
# baseurl=https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/7/x86_64/stable
# gpgcheck=0
# enabled=0

# [tsinghua_kubernetes]
# name=tsinghua_kubernetes
# baseurl=https://mirrors.tuna.tsinghua.edu.cn/kubernetes/yum/repos/kubernetes-el7-x86_64
# gpgcheck=0
# enabled=0

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

# [huawei_kubernetes]
# name=huawei_kubernetes
# baseurl=https://repo.huaweicloud.com/kubernetes/yum/repos/kubernetes-el7-x86_64
# gpgcheck=0
# enabled=0

[aliyun_kubernetes]
name=aliyun_kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
gpgcheck=0
enabled=1
UK
yum clean all
yum makecache fast

yum install git zsh bash-completion wget unzip tree tmux vim sysstat -y

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

# chsh -s zsh
# zsh
