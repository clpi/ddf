return {
  {
    "S1M0N38/love2d.nvim",
    enabled = false,
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
    enabled = false,
    opts = {},
  },
  {
    "Civitasv/cmake-tools.nvim",
    opts = {},
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal",
      open_mapping = [[<C-O>]],
      autochdir = true,
    },
  },
}
