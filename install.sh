#!/usr/bin/env bash
USER_NAME=luca;

# Basics
sudo apt-get install -y git curl jq xclip fonts-firacode

############################################
#          Oh My Zsh and plugins
############################################
echo ""
echo "Installing Oh-My-Zsh..."

# ZSH
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Plugins
sudo apt-get install -y git-extras
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

############################################
#                 VSCode
############################################
echo ""
echo "Installing VSCode..."

sudo apt-get update
sudo apt-get install -y software-properties-common apt-transport-https wget

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt-get update
sudo apt-get install -y code

###########################################
#               Node.js
###########################################
echo ""
echo "Installing Node.js"

# Node
curl -L https://git.io/n-install | bash -s -- -y

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Global packages
sudo npm install -g typescript n nodemon eslint tslint prettier
sudo npm install --unsafe-perm -g ngrok

# Use Node.js LTS version
sudo n lts

############################################
#               Databases
############################################
# echo ""
# echo "Installing databases..."

# Redis
# sudo apt-get update && sudo apt-get install -y redis-server
# sudo sed -i 's/supervised no/supervised systemd/g' /etc/redis/redis.conf
# sudo systemctl restart redis.service

# PostgreSQL
# sudo apt-get update && sudo apt-get install -y postgresql postgresql-contrib
# sudo -u postgres createuser -s $USER_NAME
# sudo -u postgres createdb $USER_NAME

# Alterar pg_hba com
# sudo nano $(psql -t -P format=unaligned -c 'show hba_file')
# sudo systemctl restart postgresql

############################################
#                 Tools
############################################
echo ""
echo "Installing tools..."

# Insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y insomnia

# Tmux
sudo apt-get install -y tmux

# AWS CLI
sudo apt-get install -y awscli

# DBeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt-get update && sudo apt-get install -y dbeaver-ce

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -y spotify-client

############################################
#             Symbolic Links
############################################

ln -s $PWD/.zshrc /home/$USER_NAME/.zshrc
ln -s $PWD/.tmux.conf /home/$USER_NAME/.tmux.conf
ln -s $PWD/.gitconfig /home/$USER_NAME/.gitconfig
