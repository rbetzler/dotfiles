set nocompatible
filetype off

call plug#begin()

Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'fannheyward/coc-pyright', {'do': 'yarn install && yarn build'}
Plug 'gelguy/wilder.nvim'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install'}
Plug 'romgrk/fzy-lua-native'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
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

" Turn off search highlighting
set nohlsearch

" Disable omnicomplete preview
set completeopt-=preview

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
nmap <F9> :setlocal spell! spelllang=en_us<CR>

" Keep the most recently pasted item in clipboard
xnoremap p pgvy

" Ale Linting and Configuration.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autoflake', 'black', 'isort'],
\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_virtualtext_cursor = 'current'
let g:ale_virtualtext_prefix = '    %comment% %type%: '

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

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align comments left
let g:NERDDefaultAlign = 'left'

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
  let file_path = trim(system('git ls-files --full-name ' . file_name))
  let line_nbr = line(".")
  " Print full github url
  echo 'https://github.com/' . repo_root . '/blob/' . branch . '/' . file_path . '#L' . line_nbr
endfunction
command! GenerateGithubLink call GenerateGithubLink()

function TurnOffSyntaxLongLines()
  set synmaxcol=300
endfunction
command! TurnOffSyntaxLongLines call TurnOffSyntaxLongLines()

" Semantically easier way to get out of a csv view
function CSVDisable()
  exec ':%UnArrangeColumn'
endfunction
command! CSVDisable call CSVDisable()

" Semantically easier way to start csv view
function CSVEnable()
  exec ':%ArrangeColumn'
endfunction
command! CSVEnable call CSVEnable()

" Menu for vim commands
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({'highlights': {'border': 'Normal'}, 'border': 'rounded'})))
set wildmenu
set wildmode=longest

" Enable fuzzy finding for wilder
call wilder#set_option('pipeline', [
  \   wilder#branch(
  \     wilder#cmdline_pipeline({
  \       'language': 'python',
  \       'fuzzy': 1,
  \     }),
  \     wilder#python_search_pipeline({
  \       'pattern': wilder#python_fuzzy_pattern(),
  \       'sorter': wilder#python_difflib_sorter(),
  \       'engine': 're',
  \     }),
  \   ),
  \ ])

" Format for wilder
let s:highlighters = [
  \ wilder#lua_fzy_highlighter(),
  \ ]

let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
  \ 'border': 'rounded',
  \ 'highlighter': s:highlighters,
  \ 'min_width': '100%',
  \ 'min_height': '25%',
  \ }))

let s:wildmenu_renderer = wilder#wildmenu_renderer({
  \ 'highlighter': s:highlighters,
  \ })

call wilder#set_option('renderer', wilder#renderer_mux({
  \ ':': s:popupmenu_renderer,
  \ '/': s:wildmenu_renderer,
  \ 'substitute': s:wildmenu_renderer,
  \ }))

" Format json files
function FormatJSON()
  exec ':%!python -m json.tool'
endfunction
command! FormatJSON call FormatJSON()

" Query postgres
function QueryPostgres()
  " Get the current window
  let l:currentWindow=winnr()
  " Write the current file
  exec ':write'
  " Get path variables
  let home_dir = expand('$HOME')
  let file_name = expand('%:p')
  " Compose, execute bash
  let cmd = home_dir . '/.bin/vim_query.sh pg ' . file_name
  exec ':below terminal ' . cmd
  " Go back to original window
  exec l:currentWindow . "wincmd w"
endfunction
command! QueryPostgres call QueryPostgres()
