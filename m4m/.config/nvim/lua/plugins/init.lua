local api = vim.api

return {
	{ "m-demare/hlargs.nvim", opts = {} },
	{
		"ThePrimeagen/refactoring.nvim",
		opts = {},
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{ "j-hui/fidget.nvim", opts = {} },
	{ "smjonas/inc-rename.nvim", opts = {} },
	{ "stevearc/oil.nvim", enabled = false, opts = {} },
	{
		"stevearc/dressing.nvim",
		enabled = true,
		opts = {},
	},

	{
		"folke/edgy.nvim",
		enabled = true,
		opts = {},
	},
	{
		"folke/noice.nvim",
		enabled = true,
		opts = {},
	},
	{ "nvim-mini/mini.extra", version = false, opts = {} },
	{ "nvim-mini/mini.files", version = false, opts = {} },
	{ "nvim-mini/mini.pick", version = false, opts = {} },
	{ "nvim-mini/mini.fuzzy", version = false, opts = {} },
	{ "nvim-mini/mini.animate", version = false, opts = {} },
	{ "nvim-mini/mini.starter", version = false, opts = {} },
	{ "nvim-mini/mini.icons", version = false, opts = {} },
	{ "nvim-mini/mini.indentscope", version = false, opts = {} },
	{ "nvim-mini/mini.surround", version = false, opts = {} },
	{ "nvim-mini/mini.clue", enabled = false, version = false, opts = {} },
	{ "nvim-mini/mini.hipatterns", enabled = true, version = false, opts = {} },
	{ "nvim-mini/mini.cursorword", enabled = true, version = false, opts = {} },
	{ "nvim-mini/mini.doc", enabled = false, version = false },
	{ "nvim-mini/mini.bufremove", enabled = true, version = false, opts = {} },
	-- { "nvim-mini/mini.pairs", version = false },
	{ "windwp/nvim-autopairs", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- Optional: For WtfGrepHistory (pick one)
			"nvim-telescope/telescope.nvim",
			"folke/snacks.nvim",
			-- "ibhagwan/fzf-lua",
		},
		opts = {},
		keys = {
			{
				"<leader>wd",
				mode = { "n", "x" },
				function()
					require("wtf").diagnose()
				end,
				desc = "Debug diagnostic with AI",
			},
			{
				"<leader>wf",
				mode = { "n", "x" },
				function()
					require("wtf").fix()
				end,
				desc = "Fix diagnostic with AI",
			},
			{
				mode = { "n" },
				"<leader>ws",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
			{
				mode = { "n" },
				"<leader>wp",
				function()
					require("wtf").pick_provider()
				end,
				desc = "Pick provider",
			},
			{
				mode = { "n" },
				"<leader>wh",
				function()
					require("wtf").history()
				end,
				desc = "Populate the quickfix list with previous chat history",
			},
			{
				mode = { "n" },
				"<leader>wg",
				function()
					require("wtf").grep_history()
				end,
				desc = "Grep previous chat history with Telescope",
			},
		},
	},
	{ "MagicDuck/grug-far.nvim", opts = {} },
	{
		"akinsho/bufferline.nvim",
		enabled = false,
		opts = {},
	},
	{
		"folke/neoconf.nvim",
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "folke/todo-comments.nvim", opts = {} },
	{ "gbprod/yanky.nvim", opts = {} },
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			formatters = {
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				elixir = { "mix" },
				python = { "isort", "black" },
				stop_after_first = true,
			},
		},
	},
	{
		"folke/snacks.nvim",
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
}
