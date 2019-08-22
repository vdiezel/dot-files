set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'mxw/vim-jsx'
Plugin 'sheerun/vim-polyglot'
Plugin 'valloric/youcompleteme'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'rking/ag.vim'
Plugin 'janko-m/vim-test'
Plugin 'rakr/vim-one'
Plugin 'ntpeters/vim-better-whitespace'

"highlights trailing and between/pre tab whitespaces
"highlight whitespaces between/preceeding tabs
hi ExtraWhitespace ctermbg=darkgrey
let g:show_spaces_that_precede_tabs=1

"remove all trailing whitespace before :w events
autocmd BufWritePre * %s/\s\+$//e

"Save on exit insert mode and focus lost
autocmd InsertLeave * write
:au FocusLost * :wa

"line numbers
set nu

"The length of time Vim waits before triggering the plugins
set updatetime=100

"vim-test (this helps with some package.json resolution instead of looking in
"root, which is a problem with mono repos)
let g:root_markers = ['package.json', '.git/']
function! s:RunVimTest(cmd)
    " I guess this part could be replaced by projectionist#project_root
    for marker in g:root_markers
        let marker_file = findfile(marker, expand('%:p:h') . ';')
        if strlen(marker_file) > 0
            let g:test#project_root = fnamemodify(marker_file, ":p:h")
            break
        endif
        let marker_dir = finddir(marker, expand('%:p:h') . ';')
        if strlen(marker_dir) > 0
            let g:test#project_root = fnamemodify(marker_dir, ":p:h")
            break
        endif
    endfor

    execute a:cmd
endfunction

nnoremap <leader>T :w \| :call <SID>RunVimTest('TestFile')<cr>
nnoremap <leader>t :w \| :call <SID>RunVimTest('TestNearest')<cr>
nnoremap <leader>A :w \| :call <SID>RunVimTest('TestSuite')<cr>
nnoremap <leader>l :w \| :call <SID>RunVimTest('TestLast')<cr>

let test#javascript#jest#file_pattern = '\vtest?/.*\.(js|jsx|coffee)$'
let test#javascript#jest#executable = 'npm run test'
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
colorscheme one
"let g:gruvbox_contrast_dark = 'medium'
set background:dark
set expandtab
set tabstop=2
set shiftwidth=2
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" autocmd vimenter * NERDTree
set undofile
set undolevels=1000
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set backupcopy=yes
let g:user_emmet_leader_key=','
set incsearch
set hlsearch
" Remove newbie crutches in Command Mode
"cnoremap <Down> <Nop>
"cnoremap <Left> <Nop>
"cnoremap <Right> <Nop>
"cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

set cursorline "highlights line cursor is on
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set scrolloff=5

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set number

