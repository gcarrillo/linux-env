#!/bin/sh -ex

# TODO: clone my linux repo and copy vimrc out of it.  This will include a
# line that will use the pathogen setup below.
# https://github.com/gcarrillo/linux-env
echo "Cloning my linux-env repo"
git clone https://github.com/gcarrillo/linux-env.git /tmp/linux-env

# https://github.com/tpope/vim-pathogen
echo "\nInstalling pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# https://github.com/tpope/vim-fugitive
echo "\nInstalling vim-fugitive"
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

# https://github.com/scrooloose/nerdtree
echo "\nInstalling nerdtree"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
vim -u NONE -c "helptags ~/.vim/bundle/nerdtree/doc" -c q

# https://github.com/vim-scripts/ZoomWin
echo "\nInstalling zoomwin"
git clone https://github.com/vim-scripts/ZoomWin.git ~/.vim/bundle/zoomwin

# https://github.com/t9md/vim-choosewin
echo "\nInstalling vim-choosewin"
git clone https://github.com/t9md/vim-choosewin.git ~/.vim/bundle/vim-choosewin

# http://cscope.sourceforge.net/cscope_vim_tutorial.html
#curl -LSso ~/.vim/plugin/cscope_maps.vim http://cscope.sourceforge.net/cscope_maps.vim
echo "\nCopying cscope_maps.vim file into place"
mkdir -p ~/.vim/plugin
cp /tmp/linux-env/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim

echo "\nCopying vimrc file into place"
cp /tmp/linux-env/vimrc ~/.vimrc

echo "\nCopying tmux.conf file into place"
cp /tmp/linux-env/tmux.conf ~/.tmux.conf

echo "\nCopying gitconfig file into place"
cp /tmp/linux-env/gitconfig ~/.gitconfig
