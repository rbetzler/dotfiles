set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim', {'pinned': 0.10.0}
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'majutsushi/tagbar'
Plugin 'shmup/vim-sql-syntax'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'glepnir/oceanic-material'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'chrisbra/csv.vim'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/tpope/vim-repeat'
Plugin 'https://github.com/tpope/vim-dadbod'
Plugin 'https://github.com/kristijanhusak/vim-dadbod-ui'
" Plugin 'https://github.com/kristijanhusak/vim-dadbod-completion'
" Plugin 'https://github.com/neoclide/coc.nvim'
Plugin 'iamcco/markdown-preview.nvim'

" Vundle exec
call vundle#end()
filetype plugin indent on

" Syntax highlighting
let python_highlight_all=1
syntax on

" Line numbering
set nu

" Access system clipboard for mac
if has('macunix')
    set clipboard=unnamed
" Or for linux
else
    set clipboard=unnamedplus
endif

" Set color scheme
set background=dark
colorscheme oceanic_material

" Set ctags
set tags+=$HOME/.ctags/tags

" Set no wrap
set nowrap

" Set split lower
set splitbelow

" Set file to autoread on open
set autoread

" Set tabs as 2 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Customize keybindings
vmap <C-c> y
vmap <C-x> x
imap <C-v> <esc>P
nmap <C-l> :NERDTreeFocusToggle<CR>

nmap <C-S-k> :wincmd k<CR>
nmap <C-S-j> :wincmd j<CR>
nmap <C-S-h> :wincmd h<CR>
nmap <C-S-l> :wincmd l<CR>
nmap <F8> :call flake8#Flake8()<CR>
" Remove trailing whitespaces
nmap <C-t><C-w> :%s/\s\+$//e<CR>

" Autoopen nerdtree
autocmd VimEnter * NERDTree | wincmd p
autocmd FileType python TagbarOpen
autocmd FileType python setlocal completeopt-=preview

" Autostart git gutter
autocmd VimEnter * GitGutter

" Autostart db ui
autocmd FileType sql DBUI

" Autoformat csv on open
" Borrowed from: https://github.com/chrisbra/csv.vim/blob/master/csv.vmb
aug CSV_Editing
    au!
    au BufRead,BufWritePost *.csv :%ArrangeColumn
    au BufWritePre *.csv :%UnArrangeColumn
aug end

" Allow mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" Query db using psql
function DBQuery()
    let file=expand('%:p')
    if file=~'.sql'
        let filename='~/Desktop/output.csv'
        let arg='psql -A -F"," -f ' . file . ' > ' . filename . ' --pset footer'
        call system(arg)
        split
        exec 'e ' . filename
        " exec ':%ArrangeColumn'
    endif
endfunction
command! DBQuery call DBQuery()

" Highlight trailing whitespace
function HighlightTrailingWhitespace()
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+\%#\@<!$/
endfunction
autocmd VimEnter,BufWritePost * call HighlightTrailingWhitespace()

" DB dad bod
let $DBUI_URL = 'postgresql:'
let g:db_ui_env_variable_name = 'PGUSER'
let g:db_ui_win_position = 'right'

" Jedi do not popup autocomplete after typing dot
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

" Run flake8 when writing a file
" autocmd BufWritePost *.py call flake8#Flake8()

" Show flake8 gutter
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" Yaml lint
let g:syntastic_yaml_checkers = ['yamllint']

" Patch xterm printing weird chars on line 1
set t_TI= t_TE=

" Github markdown plugin config
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
