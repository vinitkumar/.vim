## Dotvim

These are my vim config files that I use daily while writing code in these languages:

- Python/Django
- Go
- Rust
- C
- JavaScript, HTML, CSS

## Installation:

This project uses plug for plugin management so we will first need to install plug and then update all the plugins. In order to install the latest version:

```sh
git clone git@github.com:vinitkumar/.vim.git
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd .vim
cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
vim +PlugInstall +qall
```

![vim-screenshot](https://cldup.com/1-ZXzXpUiS-3000x3000.png)

## Fonts

I use Operator Mono font for writing my code, you can use any font that you prefer.

