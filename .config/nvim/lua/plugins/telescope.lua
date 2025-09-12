return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<space>f.",
        function()
          require("telescope.builtin").find_files({
            cwd = "/Users/clp/.config",
            prompt_title = "Browse dotfiles",
            hidden = true,
          })
        end,
        desc = "Find dotfiles",
      },
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "MoaidHathot/dotnet.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
