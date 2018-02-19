set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'sjl/badwolf'
Plugin 'reedes/vim-colors-pencil'


" Enable python folding for markdown
let g:markdown_folding=1
let g:vim_markdown_folding_style_pythonic = 1

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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


nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set number
set numberwidth=4
syntax enable
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" run table of contents
nmap toc :Toc<cr><C-w>H:vertical resize 40<cr>
let g:vim_markdown_toc_autofit=1

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

imap jj <esc>
nmap j gj
nmap k gk
" disable mouse interactions "
set mouse=nicr
map <ScrollWheelUp> <nop>
map <S-ScrollWheelUp> <nop>
map <C-ScrollWheelUp> <nop>
map <ScrollWheelDown> <nop>
map <S-ScrollWheelDown> <nop>
map <C-ScrollWheelDown> <nop>
map <ScrollWheelLeft> <nop>
map <S-ScrollWheelLeft> <nop>
map <C-ScrollWheelLeft> <nop>
map <ScrollWheelRight> <nop>
map <S-ScrollWheelRight> <nop>
map <C-ScrollWheelRight> <nop>
imap <ScrollWheelUp> <nop>
imap <S-ScrollWheelUp> <nop>
imap <C-ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
imap <S-ScrollWheelDown> <nop>
imap <C-ScrollWheelDown> <nop>
imap <ScrollWheelLeft> <nop>
imap <S-ScrollWheelLeft> <nop>
imap <C-ScrollWheelLeft> <nop>
imap <ScrollWheelRight> <nop>
imap <S-ScrollWheelRight> <nop>
imap <C-ScrollWheelRight> <nop>

" vim-taskwarrior config
let g:task_rc_override = 'rc.defaultwidth=0'
" default task report type
let g:task_report_name     = 'open'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = ['open']


" try show only 80 columns
set columns=80
set colorcolumn=80 
" autocmd VimResized * if (&columns > 80) | set columns=80 | endif
autocmd VimResized | set columns=80 
set wrap
set linebreak
"set showbreak=+++
"set textwidth=80
"set formatoptions+=t

" options for goyo and limelight markdown enhancements
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
" 
" " Highlighting priority (default: 10)
" "   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

" run Goyo automatically for markdown files
autocmd bufread,bufnewfile *.md :Goyo

" run limelight mode automatically when entering Goyo mode
" autocmd! User GoyoEnter Limelight0.7
"autocmd! User GoyoLeave Limelight!

" Switch colorscheme to pencil when in Goyo and back to badwolf when leaving

function! s:goyo_enter()
    let g:pencil_higher_contrast_ui = 0
    colorscheme pencil
    set background=dark
    Limelight0.5
    setlocal spell spelllang=en_us
endfunction

function! s:goyo_leave()
    colorscheme badwolf
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
