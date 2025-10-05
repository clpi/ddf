if vim.loader then
	vim.loader.enable()
end
if vim.env.VSCODE then
	vim.g.vscode = true
end

require("config")
require("lazy").setup({
	spec = "plugins", ---@type LazySpec
	dev = {
		--- @type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
		path = "~/.config/nvim/dev",
		fallback = false,
	},
	-- automatically check for plugin updates
	checker = {
		enabled = true,
	},
})
require("config.keymaps")

-- Setup lazy.nvim
vim.ui.select = require("dropbar.utils.menu").select
-- vim.cmd.colorscheme("tokyonight-storm")
