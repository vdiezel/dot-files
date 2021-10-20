set nocompatible              " be iMproved, required

filetype off                  " required
packadd gruvbox-material

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
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
colorscheme gruvbox-material
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
set laststatus=2
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

set cursorline "highlights line cursor is on
set scrolloff=5

if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set number
" line breaks on enter press
" line breaks on enter press
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
map <C-n> :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
nmap <Leader>r :NERDTreeRefreshRoot
let g:gitgutter_async=0
let NERDTreeShowHidden=1
"needed so that vim still understands escape sequences (otherwise scrolling will go into insert mode, it will open with fzf lookup window, etc.)
nnoremap <esc>^[ <esc>^[
"fzf replacing ctrlp
noremap <C-p> :FZF<CR>

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
"syntastic
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"Symbols
"let g:syntastic_error_symbol = "❌"
"let g:syntastic_warning_symbol = "∙∙"
"let g:syntastic_style_error_symbol = '∙'
"hi behind the symbols
"hi SyntasticErrorSign ctermfg=243 ctermbg=236 guifg=#777777 guibg=darkgrey
"JS
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

"ALE
"let g:ale_sign_error = '👹'
"let g:ale_sign_warning = '😬'
" set path for FZF
set rtp+=~/.fzf
g:ale_set_highlights

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
