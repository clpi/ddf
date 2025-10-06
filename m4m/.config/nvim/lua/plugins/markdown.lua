return {
	{ "lukas-reineke/headlines.nvim", opts = {} },
	{
		enabled = false,
		"clpi/down.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
		lazy = false,
		version = false,
		opts = {
			lsp = {},
			workspace = {
				default = "wiki",
				workspaces = {
					notes = "~/notes",
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

		ft = { "markdown", "Avante", "copilot-chat" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "Avante", "copilot-chat" },
		},
	},
}
