## Dotvim

These are my dotvim files that I use in my daily development. I have for long used a modified version of
spf13 with heavy customizations on top of it. But with time, it felt a bit sluggish and heavy. So decided
to start my .vimrc from scratch. The following config is a direct result of this. It feels very fast and it
is fun to write code in my Vim again. Hope you enjoy it and if you do, you can tip me here at https://gratipay.com/vinitkme/. Thanks! :)

## Installation:

In order to install the latest version:

```sh
git clone git@github.com:vinitkumar/.vim.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd .vim
cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
vim +BundleInstall +qall
```

![vim-screenshot](https://cldup.com/Mn3RzywYbL.png)

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
