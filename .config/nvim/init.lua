-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[
colorscheme tokyonight-moon
nno ,cd <CMD>cd %:p:h<CR>
set autochdir
]])
