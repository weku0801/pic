#!/bin/bash
yum install git zsh bash-completion wget unzip tree tmux vim -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/(git/(git zsh-syntax-highlighting zsh-autosuggestions kubectl z sudo docker helm/g' ~/.zshrc

echo 'DISABLE_AUTO_UPDATE="true"' >> ~/.zshrc
echo 'HIST_STAMPS="yyyy-mm-dd"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc

source .zshrc
