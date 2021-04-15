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

" Bundles
" Bundle 'Valloric/YouCompleteMe'

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

" Customize keybindings
vmap <C-c> y
vmap <C-x> x
imap <C-v> <esc>P
nmap <C-l> :NERDTreeFocusToggle<CR>

nmap <C-S-k> :wincmd k<CR>
nmap <C-S-j> :wincmd j<CR>
nmap <C-S-h> :wincmd h<CR>
nmap <C-S-l> :wincmd l<CR>

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

" DB dad bod
let $DBUI_URL = 'postgresql:'
let g:db_ui_env_variable_name = 'PGUSER'
let g:db_ui_win_position = 'right'

