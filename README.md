Dotvim
====

My Current Vim Configuration with Sublime Text like key bindings and fuzzy
search.

![vim-screenshot](https://i.cloudup.com/zl4e0Aj9rC-1200x1200.png)

## Installation

```bash
git clone git@github.com:vinitkumar/.vim.git
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cd .vim
cp vimrc ~/.vimrc
cp vimrc.before ~/.vimrc.before
cp vimrc.bundles ~/.vimrc.bundles
vim +BundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

## Notes

Fully configured with realtime static analysis of Python/Javascript.
Could be used for C, C++, Python, Javascript, Lisp out of the box.


