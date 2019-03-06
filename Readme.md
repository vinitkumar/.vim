## .Vim

These are the vim files I use for writing code in Python, JS(Node & React), Go etc.
It aims to be functional and fast at the same time.

![vim-screenshot](https://cldup.com/POl0j5WzkD-3000x3000.png)

For terminal emulator, I use Alacritty in combination with Vim & tmux. IMHO, it has the fastest Developer Experience on Mac.

### How to Install?

This project uses plug for plugin management so we will first need to install plug
and then update all the plugins. In order to install the latest version, just run this `curl` or `wget`
script and it will setup the vim for you.

curl:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/vinitkumar/.vim/master/install.sh)"
```

wget:

```
sh -c "$(wget https://raw.githubusercontent.com/vinitkumar/.vim/master/install.sh)"
```

### How the config is organized

For clarity and better organization, the `.vimrc` and `.gvimrc` are split into config
related to their specific tasks.

> ~/.vimrc

```vim
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

"" Reload the vim anytime a change is done in the .vimrc file
au! BufWritePost ~/.vim/parts/plugin.vim  so %
au! BufWritePost ~/.vim/parts/general.vim  so %
au! BufWritePost ~/.vim/parts/ui.vim  so %
au! BufWritePost ~/.vim/parts/autocmd.vim  so %
au! BufWritePost ~/.vim/parts/pluginconf.vim  so %
au! BufWritePost ~/.vim/parts/mappings.vim  so %
au! BufWritePost ~/.vim/parts/misc.vim  so %

au! BufWritePost .vimrc so % Reload the vim anytime a change is done in the .vimrc file
```

> ~/.gvimrc

```vim

" Some macvim specific general settings to hide some menu and whatnot
source ~/.vim/parts/gvim_general.vim
" The colorscheme and font related settings
source ~/.vim/parts/gvimui.vim

" Autoreload Macvim whenever one of the settings is changed
a" Autoreload Macvim whenever one of the settings is changed
au! BufWritePost .gvimrc so %
au! BufWritePost  ~/.vim/parts/gvim_general.vim so %
```

And that's it. It is much more concise and maintainable than before. The goal of this setup
is to use as little plugin as possible & try and utilize vim's default functionality more and more.
