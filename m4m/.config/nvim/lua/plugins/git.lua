return {
	{
		"isakbm/gitgraph.nvim",
		opts = {},
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		keys = {
			{
				"<space>gws",
				function()
					require("git-worktree").switch_worktree(vim.ui.input({ prompt = "Switch worktree:" }))
				end,
				desc = "Switch git worktree",
			},
			{
				"<space>gwc",
				function()
					require("git-worktree").delete_worktree(vim.ui.input({ prompt = "Delete worktree" }))
				end,
				desc = "Create git worktree",
			},
			{
				"<space>gwn",
				"<CMD>Telescope git_worktree create_worktree<CR>",
				desc = "Telescope create worktree",
			},
			{
				"<space>gww",
				"<CMD>Telescope git_worktree git_worktree<CR>",
				desc = "Telescope worktrees",
			},
			{
				"<space>gwf",
				"<CMD>Telescope git_worktree git_worktrees<CR>",
				desc = "Telescope worktrees",
			},
			{
				"<space>gwd",
				function()
					require("git-worktree").create_worktree(vim.ui.input({ prompt = "Create worktree" }))
				end,
				desc = "Create git worktree",
			},
		},
		after = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("git-worktree").setup({})
		end,
	},
	{ "sindrets/diffview.nvim", opts = {} },
	{
		"NeogitOrg/neogit",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"nvim-mini/mini.pick", -- optional
			"folke/snacks.nvim", -- optional
		},
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
