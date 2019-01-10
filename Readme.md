## .Vim

These are the vim files I use for writing code in Python, JS(Node & React), Go etc.
It aims to be functional and fast at the same time.

![vim-screenshot](https://cldup.com/zTj5LbpxY0.png)

For terminal emulator, I use Alacritty in combination with Vim. IMHO, it has the faster UX on Mac.

### How to Install?

This project uses plug for plugin management so we will first need to install plug
and then update all the plugins. In order to install the latest version:

```sh
git clone git@github.com:vinitkumar/.vim.git
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd .vim
cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
vim +PlugInstall +qall
```

In order to change font to something other, change this in your .vimrc:

```
set guifont=Menlo:h13
```
