return {
    "chrisbra/csv.vim",
    "dense-analysis/ale",
    {
        "dracula/vim",
        name = "dracula",
    },
    {
        "fannheyward/coc-pyright",
        build = "yarn install && yarn build",
    },
    "gelguy/wilder.nvim",
    {
        "https://github.com/airblade/vim-gitgutter",
        init = function()
            vim.g.gitgutter_map_keys = 0
        end,
    },
    "https://github.com/tpope/vim-repeat",
    "https://github.com/tpope/vim-surround",
    "mg979/vim-visual-multi",
    {
        "neoclide/coc.nvim",
        branch = "release",
        build = "yarn install",
    },
    "pogyomo/winresize.nvim",
    "preservim/nerdcommenter",
    "romgrk/fzy-lua-native",
    "scrooloose/nerdtree",
    "sheerun/vim-polyglot",
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
}
