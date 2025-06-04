vim.g.mapleader = " "
vim.g.maplocalleader = ";"

require("configs.lazy")

require("bindings")
require("files")
require("general")
require("github")

require("configs.ale")
require("configs.wilder")
