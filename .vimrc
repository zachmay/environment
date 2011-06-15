if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set ai                      "always set autoindenting on
set autoindent
set backup                  " keep a backup file
set backupdir=~/.vim/backup
set directory=~/.vim/temp
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set cmdheight=1
set hidden
set history=1000          " keep 1000 lines of command line history
set incsearch
set makeef=error.err
set nocompatible            " Use Vim defaults (much better!)
set number
set ruler                 " show the cursor position all the time
set scrolloff=3
set expandtab
set shiftwidth=4
set tabstop=4
set showcmd
set showmode
set smartindent
set t_Co=256
set title
set viminfo='20,\"50      " read/write a .viminfo file, don't store more " than 50 lines of registers
set wildmenu
set wildmode=list:longest

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
 if &t_Co > 2 || has("gui_running")
   set t_Co=256
   colorscheme slate
   syntax on
   set nohlsearch
 endif

filetype plugin on
filetype indent on

map <C-N> :tabprev<CR>
map <C-M> :tabnext<CR>

"if has("gui_running") || (&term == "win32") || (&term == "pcterm") || (&term == "xterm")
"    map <S-Left> :tabprev<CR>
"    map <S-Right> :tabnext<CR>
"    map! <S-Left> <Esc>:tabprev<CR>
"    map! <S-Right> <ESC>:tabnext<CR>
"else
"    map <Esc>[D :tabprev<CR>
"    map <Esc>[C :tabnext<CR>
"    map! <Esc>[D <Esc>:tabprev<CR>
"    map! <Esc>[C <ESC>:tabnext<CR>
"endif

"au FileType php set omnifunc=phpcomplete#CompletePHP
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
