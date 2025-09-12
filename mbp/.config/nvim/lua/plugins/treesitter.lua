return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = true,
      },
      {
        "abecodes/tabout.nvim", -- Tab out from parenthesis, quotes, brackets...
        enable = false,
        opts = {
          tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
          completion = true, -- We use tab for completion so set this to true
        },
      },
      {
        "windwp/nvim-autopairs", -- Autopair plugin
        event = "InsertEnter",
        opts = {
          check_ts = true,
          enable_moveright = true,
          fast_wrap = {
            map = "<c-e>",
          },
        },
        config = function(_, opts)
          local autopairs = require("nvim-autopairs")

          autopairs.setup(opts)

          local Rule = require("nvim-autopairs.rule")
          local ts_conds = require("nvim-autopairs.ts-conds")

          autopairs.add_rules({
            Rule("{{", "  }", "vue"):set_end_pair_length(2):with_pair(ts_conds.is_ts_node("text")),
          })
        end,
      },
      "nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects, select, move, swap, and peek support.
      {
        "JoosepAlviste/nvim-ts-context-commentstring", -- Smart commenting in multi language files - Enabled in Treesitter file
        config = true,
      },
      { "RRethy/nvim-treesitter-endwise" },
    },
    opts = {
      endwise = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.inner",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sa"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>sA"] = "@parameter.inner",
          },
        },
      },
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>", -- Set to `false` to disable
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },
      indent = { enable = true, disable = { "yaml", "ruby" } },
      ensure_installed = {
        "bash",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
