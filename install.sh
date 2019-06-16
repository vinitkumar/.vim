#! /bin/sh

git clone git@github.com:vinitkumar/.vim.git
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd .vim
cp ~/.vimrc ~/.vimrc.backup
cp ~/.gvimrc ~/.gvimrc.backup
ln -s vimrc ~/.vimrc
ln -s gvimrc ~/.gvimrc
vim +PlugInstall +qall
