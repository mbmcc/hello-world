" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"###################################################
" developer config 
" https://gist.github.com/rocarvaj/2513367
"#################################################
" VIM Configuration File

" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"



" set UTF-8 encoding

set enc=utf-8

set fenc=utf-8

set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)

set nocompatible

" use indentation of previous line

set autoindent

" use intelligent indentation for C

set smartindent

" configure tabwidth and insert spaces instead of tabs

set tabstop=4        " tab width is 4 spaces

set shiftwidth=4     " indent also with 4 spaces

set expandtab        " expand tabs to spaces

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.

set textwidth=120

" turn syntax highlighting on

set t_Co=256

syntax on

" colorscheme wombat256

" turn line numbers on

set number

" highlight matching braces

set showmatch

" intelligent comments

set comments=sl:/*,mb:\ *,elx:\ */



" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion

" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>

" Load standard tag files

set tags+=~/.vim/tags/cpp

set tags+=~/.vim/tags/gl

set tags+=~/.vim/tags/sdl

set tags+=~/.vim/tags/qt4



" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987

let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"



" Enhanced keyboard mappings

  in normal mode F2 will save the file

nmap <F2> :w<CR>

" in insert mode F2 will exit insert, save, enters insert again

imap <F2> <ESC>:w<CR>i

" switch between header/source with F4

map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5

map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>

" create doxygen comment

map <F6> :Dox<CR>

" build using makeprg with <F7>

map <F7> :make<CR>

" build using makeprg with <S-F7>

map <S-F7> :make clean all<CR>

" goto definition with F12

map <F12> <C-]>

" in diff mode we use the spell check keys for merging

if &diff

  ” diff settings

  map <M-Down> ]c

  map <M-Up> [c

  map <M-Left> do

  map <M-Right> dp

  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg

else

  " spell settings

  :setlocal spell spelllang=en

  " set the spellfile - folders must exist

  set spellfile=~/.vim/spellfile.add

  map <M-Down> ]s

  map <M-Up> [s

endif
