return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
  },
  { "Mythos-404/xmake.nvim", opts = {} },
  { "S1M0N38/love2d.nvim", opts = {} },
  {
    "alaviss/nim.nvim",
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    opts = {},
    config = function()
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<c-o>]],
      direction = "horizontal",
      -- size = 25,
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {},
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
}
