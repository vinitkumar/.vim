## .Vim

These are the vim files I use for writing code in Python, JS(Node & React), Go etc.
It aims to be functional and fast at the same time.

![vim-screenshot](https://cldup.com/POl0j5WzkD-3000x3000.png)

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

### How the config is organized

For clarity and better organization, the `.vimrc` and `.gvimrc` are split into config
related to their specific tasks.

> .vimrc

```
" previously my .vimrc file had a lot of config without much
" organization. So with this refactor they are better organized

" Load Plug plugin and define the plugins to be used
source ~/.vim/parts/plugin.vim
" General settings
source ~/.vim/parts/general.vim
" UI settings, deals with theme, font etc
source ~/.vim/parts/ui.vim
" All autocmds are here.
source ~/.vim/parts/autocmd.vim
" Plugin specific tunings are here
source ~/.vim/parts/pluginconf.vim
" All the mappings are done here
source ~/.vim/parts/mappings.vim
" some misc plugins/ functions picked/borrowed from the Internets
source ~/.vim/parts/misc.vim

" Reload the vim anytime a change is done in the .vimrc file
au! BufWritePost .vimrc so %
```

> ~/.gvimrc

```

" Some macvim specific general settings to hide some menu and whatnot
source ~/.vim/parts/gvim_general.vim
" The colorscheme and font related settings
source ~/.vim/parts/gvimui.vim

" Autoreload Macvim whenever one of the settings is changed
au! BufWritePost .gvimrc so %
```

And that's it. It is more concise and more maintainable than before. The goal of this setup
is to use as little plugin as possible & try and utilize vim's default functionality more and more.
