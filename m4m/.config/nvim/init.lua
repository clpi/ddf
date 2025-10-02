require("opts")
require("setup")
require("keymaps")
require("abbrev")
require("lsp")
require("ft")

require("lazy").setup({
	spec = "plugins", ---@type LazySpec
	dev = {
		--- @type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
		path = "~/.config/nvim/dev",
		fallback = false,
	},
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

-- Setup lazy.nvim
vim.ui.select = require("dropbar.utils.menu").select
