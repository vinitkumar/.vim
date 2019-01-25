set guioptions=0
let macvim_hig_shift_movement = 1
set fuoptions=maxvert,maxhorz
set noballooneval
" Automatically resize splits
" when resizing MacVim window
autocmd VimResized * wincmd =
macmenu File.New\ Tab key=<nop>
macmenu &File.New\ Window key=<nop>
macmenu &File.New\ Tab key=<nop>
macmenu &File.New\ Tab key=<D-n>
macmenu &File.New\ Window key=<D-N>
macmenu &Tools.List\ Errors key=<nop>

