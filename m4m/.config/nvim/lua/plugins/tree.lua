return {

	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		opts = {},
	},
}
