## Dotvim

My Vim config files for Python, JavaScript and Go development. I now use awesome vim-plug
to manage the plugins. It's a constant work in progress so expect lot of activity. But I will
try to keep it as stable as possible.

## Installation:

In order to install the latest version:

```sh
git clone git@github.com:vinitkumar/.vim.git
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd .vim
cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
cp bundles.vim ~/bundles.vim
vim +PlugInstall +qall
```

![vim-screenshot](https://cldup.com/858Ow0Plhv.png)

In order to install the older version of my dotvim:

```sh
git clone git@github.com:vinitkumar/.vim.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd .vim
git fetch origin
git checkout origin/master-old
cp vimrc ~/.vimrc
cp vimrc.before ~/.vimrc.before
cp vimrc.bundles ~/.vimrc.bundles
vim +BundleInstall +qall
```

## Fonts

Install the font [Inconsolata for Powerline.otf](https://github.com/powerline/fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf)

## Notes:

Patches and fixes are most welcome. Just make sure that you aren't breaking something. Also, open issues
for any feature requests.
