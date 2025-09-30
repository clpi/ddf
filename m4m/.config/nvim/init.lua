require("opts")
require("setup")
require("keymaps")
require("plugins")
require("abbrev")
require("lsp")
require("ft")

-- Setup lazy.nvim
vim.ui.select = require("dropbar.utils.menu").select
