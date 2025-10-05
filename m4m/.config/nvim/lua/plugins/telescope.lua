return {

	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			require("telescope").load_extension("git_worktree")
			require("telescope").load_extension("zoxide")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("aerial")
			require("telescope").load_extension("file_browser")

			return {}
		end,
		dependencies = {
			"ThePrimeagen/git-worktree.nvim",
			"sindrets/diffview.nvim",
			"stevearc/aerial.nvim",
			"NeogitOrg/neogit",
			"jvgrootveld/telescope-zoxide",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
}
