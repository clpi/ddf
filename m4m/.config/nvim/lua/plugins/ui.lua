return {
	{ "m-demare/hlargs.nvim", opts = {} },
	-- { "nvim-mini/mini.starter", version = false, opts = {} },
	{
		"folke/edgy.nvim",
		enabled = true,
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer keymaps",
			},
		},
		enabled = true,
		lazy = true,
		opts = {
			preset = "helix", -- helix false classic modern
			delay = 0,
		},
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
	},
}
