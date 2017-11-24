## .Vim

These are my config files for writing code in Python, Go, Rust, C and HTML/JS/CSS.
The config aims to be simple and fast for writing code.

![vim-screenshot](https://cldup.com/1-ZXzXpUiS-3000x3000.png)

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

I use Operator Mono font for writing my code, you can use any font that you prefer.
For e.g: In order to change font to something other, change this in your .vimrc:

```
set guifont=Menlo:h13
```
