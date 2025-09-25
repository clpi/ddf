return {
	{ "stevearc/overseer.nvim", opts = {} },
	{ "stevearc/aerial.nvim", opts = {} },
	{ "iamcco/markdown-preview.nvim", opts = {}, enabled = false },
	{ "NeogitOrg/neogit", opts = {}},
	{ "nvim-orgmode/orgmode.nvim", opts = {} },
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
	-- { "mfussenegger/nvim-dap", opts = {}},

{
    'nvim-lualine/lualine.nvim',
		config = function()
			require("lualine").setup(require("plug.lualine.bubbles"))
		end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
{
	'akinsho/bufferline.nvim', 
	opts = {},
	version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-o>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2, -- the degree by which to darken the terminal colour, default: 2, [1, 3]
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell,  -- change the default shell
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
    },
  }
}
