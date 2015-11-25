"http://superuser.com/questions/319591/how-can-i-prevent-macvim-from-showing-os-x-find-replace-dialog-when-pressing-co
if has("gui_macvim")
  " Disable print shortcut for 'goto anything...'
    macmenu File.Print key=<nop>

  " Disable new tab shortcut for 'goto file...'
  macmenu File.New\ Tab key=<nop>

  " Move  with cmd+alt
  macm Window.Select\ Previous\ Tab  key=<D-M-LEFT>
  macm Window.Select\ Next\ Tab	   key=<D-M-RIGHT>

  " Open new window via cmd+shift+n
  macmenu File.New\ Window key=<D-N>

endif

if has("gui_macvim")
  set guioptions=aAce
  set fuoptions=maxvert,maxhorz
  set noballooneval
  set columns=300

  " Automatically resize splits
  " when resizing MacVim window
  autocmd VimResized * wincmd =
  macmenu File.New\ Tab key=<nop>
elseif has("gui_gtk2")
  set guioptions-=T
  silent! colorscheme slate
endif

set t_Co=256
set background=dark
colorscheme badwolf
