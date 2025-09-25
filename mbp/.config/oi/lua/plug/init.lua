return {
	{
		"S1M0N38/love2d.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>v", ft = "lua", desc = "LÖVE" },
			{ "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
			{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
		},
	},
	{
		"mythos-404/xmake.nvim",
		opts = {},
	},
	{
		"Civitasv/cmake-tools.nvim",
		opts = {},
	},

	{ "alaviss/nim.nvim" },
	{ "folke/trouble.nvim", opts = {} },

	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",

		opts = {

			integrations = {
				lspconfig = true,
				cmp = false,
				coq = false,
			},
			runtime = vim.env.VIMRUNTIME,
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "/Users/clp/.local/share/lunarvim/lvim/lua", words = { "lvim" } },
				-- { path = "LazyVim", words = { "LazyVim" } },
				-- { path = "snacks.nvim", words = { "Snacks" } },
				-- { path = "lazy.nvim", words = { "LazyVim" } },
				{ path = "/Users/clp/down/down.nvim", words = { "down" } },
			},
		},
	},
	{ "folke/todo-comments.nvim", opts = {} },
	{ "stevearc/conform.nvim", opts = {} },
	{ "stevearc/overseer.nvim", opts = {} },
	{ "folke/persistence.nvim", opts = {} },
	{ "folke/which-key.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{ "jvgrootveld/telescope-zoxide", opts = {} },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
		-- additional lazy config to defer loading is not really needed...
		config = function()
			-- optional setup call to override plugin options
			-- alternatively you can set options with vim.g.grug_far = { ... }
			require("grug-far").setup({
				-- options, see Configuration section below
				-- there are no required options atm
			})
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
}
