return {
    "chrisbra/csv.vim",
    "dense-analysis/ale",
    {
        "dracula/vim",
        name = "dracula",
    },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    -- },
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
    -- {
    --     "junegunn/goyo.vim",
    --     init = function()
    --         vim.g.goyo_width = "100%"
    --         vim.g.goyo_height = "100%"
    --     end,
    -- },
    "mg979/vim-visual-multi",
    {
        "neoclide/coc.nvim",
        branch = "release",
        build = "yarn install",
    },
    -- {
    --   "olimorris/codecompanion.nvim",
    --   version = "^19.0.0",
    --   opts = {},
    --   config = function()
    --     require("codecompanion").setup({
    --       interactions = {
    --         chat = {
    --           adapter = "ollama",
    --         },
    --         inline = {
    --           adapter = "ollama",
    --         },
    --         cmd = {
    --           adapter = "ollama",
    --         }
    --       },
    --       adapters = {
    --         http = {
    --           ollama = function()
    --             return require("codecompanion.adapters").extend("ollama", {
    --               env = {
    --                 url = "http://desktop.local:11434",
    --               },
    --               headers = {
    --                 ["Content-Type"] = "application/json",
    --               },
    --               parameters = {
    --                 sync = true,
    --               },
    --             })
    --           end,
    --         },
    --       },
    --     })
    --   end,
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-treesitter/nvim-treesitter",
    --   },
    -- },
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
    -- {
    --   "yetone/avante.nvim",
    --   build = "make",
    --   event = "VeryLazy",
    --   version = false,
    --   ---@module 'avante'
    --   ---@type avante.Config
    --   opts = {
    --     -- instructions_file = "avante.md",
    --     provider = "ollama",
    --     mode = "legacy",
    --     -- disable_tools = true,
    --     providers = {
    --       ollama = {
    --         endpoint = "http://desktop.local:11434",
    --         model = "qwen3.5:4b",
    --         is_env_set = true,
    --         timeout = 3000,
    --         mode = "legacy",
    --         disable_tools = true,
    --         extra_request_body = {
    --           temperature = 0.15,
    --           max_tokens = 204,
    --         },
    --       },
    --       -- ollama_embed = {
    --       --   __inherited_from = "ollama",
    --       --   endpoint = "http://desktop.local:11434",
    --       --   model = "qwen3-embedding:4b",
    --       --   is_env_set = true,
    --       --   timeout = 3000,
    --       --   mode = "legacy",
    --       --   disable_tools = true,
    --       --   extra_request_body = {
    --       --     temperature = 0.15,
    --       --     max_tokens = 204,
    --       --   },
    --       -- },
    --     },
    --     -- rag_service = {
    --     --   enabled = true,
    --     --   host_mount = "~/repos/dbt-common",
    --     --   runner = "docker",
    --     --   llm = {
    --     --     provider = "ollama_qwen",
    --     --     endpoint = "http://desktop.local:11434",
    --     --     api_key = "",
    --     --     model = "qwen3.5:4b",
    --     --   },
    --     --   embed = {
    --     --     provider = "ollama_embed",
    --     --     endpoint = "http://desktop.local:11434",
    --     --     api_key = "",
    --     --     model = "qwen3-embedding:4b",
    --     --   },
    --     -- },
    --   },
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "MunifTanjim/nui.nvim",
    --     "nvim-mini/mini.pick",
    --     "nvim-telescope/telescope.nvim",
    --     "hrsh7th/nvim-cmp",
    --     "ibhagwan/fzf-lua",
    --     "stevearc/dressing.nvim",
    --     "folke/snacks.nvim",
    --     "nvim-tree/nvim-web-devicons",
    --     -- {
    --     --   "MeanderingProgrammer/render-markdown.nvim",
    --     --   opts = {
    --     --     file_types = { "markdown", "Avante" },
    --     --   },
    --     --   ft = { "markdown", "Avante" },
    --     -- },
    --   },
    -- },
    {
      "nickjvandyke/opencode.nvim",
      version = "*", -- Latest stable release
      dependencies = {
        {
          ---@module "snacks"
          "folke/snacks.nvim",
          optional = true,
          opts = {
            input = {},
            picker = {
              actions = {
                opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
              },
              win = {
                input = {
                  keys = {
                    ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                  },
                },
              },
            },
          },
        },
      },
      config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {}
        vim.o.autoread = true
        -- Recommended/example keymaps
        vim.keymap.set({ "n", "x" }, "<leader><C-a><C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
        vim.keymap.set({ "n", "x" }, "<leader><C-a><C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "t" }, "<leader><C-a><C-t>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })
        vim.keymap.set({ "n", "x" }, "<leader><C-a><C-g>",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
        -- vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })
        -- vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
        -- vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })
        -- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
        -- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
      end,
    }
}
