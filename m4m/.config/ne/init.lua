if vim.loader then vim.loader.enable() end

vim.cmd.filetype("plugin indent on")
-- the end of the line
-- ~/.config/nvim-new/lua/autocmds.lua


require("plugins")
require("config")
require("lsp")
-- o.guicursor = "i:beam"
vim.cmd.colorscheme('duskfox')
