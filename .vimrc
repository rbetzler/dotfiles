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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'majutsushi/tagbar'
Plugin 'shmup/vim-sql-syntax'
" Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'chrisbra/csv.vim'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/tpope/vim-repeat'
Plugin 'https://github.com/tpope/vim-fugitive'
" Plugin 'https://github.com/tpope/vim-dadbod'
" Plugin 'https://github.com/kristijanhusak/vim-dadbod-ui'
Plugin 'dracula/vim', { 'name': 'dracula' }
" Plugin 'https://github.com/kristijanhusak/vim-dadbod-completion'
" Plugin 'https://github.com/neoclide/coc.nvim'
" A few manual steps in https://github.com/iamcco/markdown-preview.nvim
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Vundle exec
call vundle#end()
filetype plugin indent on

" Syntax highlighting
let python_highlight_all=1
syntax on

" Line numbering
set nu

" Access system clipboard
set clipboard=unnamedplus

" Set color scheme
set background=dark
colorscheme dracula

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

nmap <C-k> :wincmd k<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-l> :wincmd l<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-a> :NERDTreeFocusToggle<CR>
nmap <F8> :call flake8#Flake8()<CR>
nmap <F9> :setlocal spell! spelllang=en_us<CR>

" Keep the most recently pasted item in clipboard
xnoremap p pgvy

" Autoopen nerdtree
" autocmd VimEnter * NERDTree | wincmd p
" autocmd FileType python TagbarOpen
" autocmd FileType python setlocal completeopt-=preview

" Autostart git gutter
autocmd VimEnter * GitGutter

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

" Highlight trailing whitespace
function HighlightTrailingWhitespace()
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+\%#\@<!$/
endfunction
autocmd VimEnter,BufWritePost * call HighlightTrailingWhitespace()

" Jedi do not popup autocomplete after typing dot
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

" Show flake8 gutter
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" Yaml lint
let g:syntastic_yaml_checkers = ['yamllint']

" Patch xterm printing weird chars on line 1
set t_TI= t_TE=

" Settings for mutt, when in mutt
function MuttSettings()
  set wrap
  set spell spelllang=en_us
  execute ":NERDTreeClose"
endfunction
autocmd VimEnter /tmp/neomutt* call MuttSettings()

function WritePyBreakpoint()
  let line=line('.')
  let indent=indent(line)
  let pad = repeat(' ', indent)
  call append(line - 1, pad . 'breakpoint()')
endfunction
command! WritePyBreakpoint call WritePyBreakpoint()
nmap <C-b><C-k> :WritePyBreakpoint<CR>

function RemovePyBreakpoints()
  exec ':g/breakpoint()/d'
endfunction
command! RemovePyBreakpoints call RemovePyBreakpoints()

function RemoveWhiteSpaces()
  exec ':%s/\s\+$//e'
endfunction
command! RemoveWhiteSpaces call RemoveWhiteSpaces()

function GenerateGithubLink()
  " Get the current branch name and string the new line chars
  let branch = substitute(system('git branch --show-current'), '\n\+$', '', '')
  " Get the current repo url, parse it
  let url = system('git config --get remote.origin.url')
  let raw_repo_root = split(url, ":")[1]
  let repo_root = split(raw_repo_root, ".git")[0]
  let file_name = @%
  let line_nbr = line(".")
  " Print full github url
  echo 'https://github.com/' . repo_root . '/blob/' . branch . '/' . file_name . '#L' . line_nbr
endfunction
command! GenerateGithubLink call GenerateGithubLink()

function TurnOffSyntaxLongLines()
  set synmaxcol=300
endfunction
command! TurnOffSyntaxLongLines call TurnOffSyntaxLongLines()
