#!/bin/bash

sudo apt install net-tools curl nodejs vim -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo update-alternatives --config editor
sudo visudo # Change to NOPASSWD: ALL
cp ../vim/.vimrc ~/
vim +PluginInstall +qall
cd ~/.vim/bundle/coc.nvim; npm install; npm run build; cd ~

# Setup gcloud
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg -y
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update -y && sudo apt-get install google-cloud-sdk kubectl -y

# i3 related
sudo apt install pavucontrol feh picom -y
