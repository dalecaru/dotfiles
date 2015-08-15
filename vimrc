set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ervandew/supertab'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" General
set nobackup
set nowritebackup
set noswapfile
set autoread
set encoding=utf-8
syntax enable

" UI
set t_Co=256
set title
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
colorscheme jellybeans

" Text Formatting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set formatoptions=n
set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set showmatch

" Status Line
set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v][%{fugitive#statusline()}]

" NERDTree
map <C-n> :NERDTreeToggle<CR>
