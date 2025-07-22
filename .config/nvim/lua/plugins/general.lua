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
    {
        "junegunn/goyo.vim",
        init = function()
            vim.g.goyo_width = "100%"
            vim.g.goyo_height = "100%"
        end,
    },
    "mg979/vim-visual-multi",
    {
        "neoclide/coc.nvim",
        branch = "release",
        build = "yarn install",
    },
    "pogyomo/winresize.nvim",
    "preservim/nerdcommenter",
    {
        "preservim/vim-pencil",
        init = function()
            vim.g["pencil#wrapModeDefault"] = "soft"
        end,
    },
    "romgrk/fzy-lua-native",
    "scrooloose/nerdtree",
    "sheerun/vim-polyglot",
    {
        "vim-airline/vim-airline",
        init = function()
            vim.g.airline_section_x = ''
            vim.g.airline_section_y = ''
            vim.g.airline_section_z = ''
            vim.g.airline_extensions = {}
        end,
    },
    "vim-airline/vim-airline-themes",
}
