require("opts")
require("setup")
require("keymaps")
require("plugins")
require("abbrev")
require("lsp")
require("ft")

vim.cmd([[
colorscheme catppuccin-mocha
]])

vim.ui.select = require("dropbar.utils.menu").select

-- Setup lazy.nvim
