#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 or newer instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .


sudo apt-get -y install vim-gtk subversion git-core meld smbfs minicom tftp-hpa tftpd-hpa 

sudo apt-get -y install tofrodos
sudo ln -s /usr/bin/fromdos /usr/bin/dos2unix
sudo ln -s /usr/bin/todos /usr/bin/unix2dos

sudo apt-get -y install zlibc zlib1g-dev

sudo apt-get -y install libdirectfb-dev libtiff4-dev

sudo apt-get -y install manpages-posix manpages-posix-dev

sudo apt-get -y install nfs-kernel-server

# UUID library
sudo apt-get -y install uuid uuid-dev 

# Data compression library
sudo apt-get -y install liblzo2-2 liblzo2-dev

# Scratchbox2
sudo apt-get -y install scratchbox2 qemu-kvm-extras

# curl
sudo apt-get -y install curl

# Cscope
sudo apt-get -y install cscope

mkdir -p ~/.vim/autoload ~/.vim/bundle;
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

found_pathogen=`awk ' /pathogen#/ ' /home/${USER}/.vimrc`
if [ -z "$found_pathogen" ]; then
    echo "execute pathogen#infect()" >> ~/.vimrc
fi

# vim mapping for cscope
mkdir -p ~/.vim/plugin

wget http://cscope.sourceforge.net/cscope_maps.vim -O ~/.vim/plugin/cscope_maps.vim

cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git
git clone git://github.com/majutsushi/tagbar
git clone https://github.com/vim-scripts/autoload_cscope.vim
git clone https://github.com/vim-scripts/OmniCppComplete
git clone https://github.com/scrooloose/nerdtree

cd ~

