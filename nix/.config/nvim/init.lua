-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").fish_lsp.setup({})

vim.cmd([[
]])
vim.opt.guifont = "ZedMono Nerd Font:h9"
