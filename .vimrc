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
set tags+=$HOME/ctags/

" Set no wrap
set nowrap

" Set split lower
set splitbelow

" Customize keybindings
vmap <C-c> y
vmap <C-x> x
imap <C-v> <esc>P
nmap <C-l> :NERDTreeFocusToggle<CR>

" Autoopen nerdtree
autocmd VimEnter * NERDTree | wincmd p
autocmd FileType python TagbarOpen
autocmd FileType python setlocal completeopt-=preview

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

function DBQuery()
    :let file=expand('%:p')
    :let arg='psql -A -F"," -f ' . file . ' > ~/Desktop/output.csv --pset footer'
    :echo arg
    :call system(arg)
    :terminal vim Desktop/output.csv
endfunction
command! DBQuery call DBQuery()

