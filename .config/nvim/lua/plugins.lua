
vim.cmd('filetype plugin indent off')

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('chrisbra/csv.vim')
Plug('ctrlpvim/ctrlp.vim')
Plug('dense-analysis/ale')
Plug('dracula/vim', { ['name'] = 'dracula' })
Plug('fannheyward/coc-pyright', { ['do'] = 'yarn install && yarn build' })
Plug('gelguy/wilder.nvim')
Plug('https://github.com/airblade/vim-gitgutter')
Plug('https://github.com/tpope/vim-fugitive')
Plug('https://github.com/tpope/vim-repeat')
Plug('https://github.com/tpope/vim-surround')
Plug('jistr/vim-nerdtree-tabs')
Plug('majutsushi/tagbar')
Plug('mg979/vim-visual-multi', { ['branch'] = 'master'})
Plug('neoclide/coc.nvim', { ['branch'] = 'release', ['do'] = 'yarn install' })
Plug('romgrk/fzy-lua-native')
Plug('preservim/nerdcommenter')
Plug('scrooloose/nerdtree')
Plug('sheerun/vim-polyglot')
Plug('tpope/vim-commentary')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

vim.call('plug#end')
vim.cmd('filetype plugin indent on')
