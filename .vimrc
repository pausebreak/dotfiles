" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

execute pathogen#infect()

set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set encoding=utf-8
set paste
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
" set smartindent

" Power line stuff
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
" let g:Powerline_symbols = 'unicode'
set t_Co=256
" always show statusline
set laststatus=2
" set fillchars+=stl:\ ,stlnc:\

" signify stuff
let g:signify_sign_delete_first_line = '?'
let g:signify_vcs_list = ['git']

" allow backspacing over everything in insert mode
set backspace=indent,eol,start        

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>     

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
"  set spell
  set paste
  colorscheme desert
  set laststatus=2
  set antialias
" let g:signify_mapping_toggle_highlight = '<leader>gh'
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  " Do these work??
  autocmd Filetype html setlocal tabstop=2
  autocmd Filetype html setlocal softtabstop=2
  autocmd Filetype js setlocal tabstop=2
  autocmd Filetype js setlocal softtabstop=2
  autocmd Filetype css setlocal tabstop=2
  autocmd Filetype css setlocal softtabstop=2

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " autocmd FileType html,js,css,clj,md autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd BufWritePre *.{js,html,css,md,clj} :%s/\s\+$//e                    

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

set wildignore+=*/node_modules
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

