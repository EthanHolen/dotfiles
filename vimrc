""""""""""""""""""""""
" Ethan Holen's .vimrc
""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


"UTILITES
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'kana/vim-surround'
Plugin 'junegunn/goyo.vim'
Plugin 'Wombat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mhinz/vim-signify'
""Plugin 'ycm-core/YouCompleteMe'
Plugin 'mg979/vim-visual-multi'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal



"BASIC STUFF
" set number
set relativenumber
syntax on
set hlsearch
set wrap
set mouse=a
" Yank to sys clipboard
set clipboard=unnamed
" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk



"Lightline Display
set laststatus=2

map <f6> :setlocal spell! spelllang=en_us<CR>


