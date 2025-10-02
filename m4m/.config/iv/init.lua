require("opts")
require("setup")
require("keymaps")
require("plugins")
require("abbrev")
require("lsp")
require("ft")

require("lazy").setup({
	spec = "plugins", ---@type LazySpec
	install = {
		colorscheme = {
			"habamax",
		},
	},
	-- automatically check for plugin updates
	checker = {
		enabled = true,
	},
})

vim.ui.select = require("dropbar.utils.menu").select

-- Setup lazy.nvim
vim.cmd([[
colorscheme catppuccin-mocha
]])
