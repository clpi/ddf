return {
{
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = true
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
		}
	},
	{
		"RRethy/nvim-treesitter-endwise",
	},
	{
		"RRethy/nvim-treesitter-textsubjects",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
		}
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
