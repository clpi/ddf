return {
	{
		"clpi/down.nvim",
		lazy = false,
		opts = {
			workspace = {
				default = "icloud",
				workspaces = {
					icloud = "~/Library/Mobile Documents/com~apple~CloudDocs/wiki",
					wiki = "~/wiki",
				},
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		enabled = false,
		before = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		ft = { "markdown", "Avante", "code-companion", "copilot-chat", "sidekick" },
	},
}
