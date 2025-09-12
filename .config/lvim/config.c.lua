-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny,
lvim.builtin.mason.install_root_dir = "/Users/clp/.local/share/nvim/mason"

lvim.builtin.cmp.window.documentation = {
  border = "none",
  winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
  col_offset = -3,
  side_padding = 1,
}

lvim.builtin.cmp.window.completion = {
  border = "none",
  winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
  col_offset = -3,
  side_padding = 1,
}
lvim.builtin.cmp.mapping["<tab>"] = nil
lvim.builtin.cmp.mapping["<s-tab>"] = nil
lvim.builtin.cmp.enabled = true

vim.cmd[[
  nno ; :
  nno H <cmd>bn<CR>
  nno L <cmd>bp<CR>
  cabbrev tl Telescope
]]

---@type blink.cmp.Config
local cc = {

  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   opts = {
  --     keymap = {
  --     },
  --     sources = {
  --       default = { "minuet" },
  --     },
  --   },
  -- },
        keymap = {
          preset = "enter",
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
        },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
      treesitter_highlighting = true,
      update_delay_ms = 0,
      window = {
        winblend = 10,
        border = "none"
      },
    },
  },
        appearance = {
          use_nvim_cmp_as_default = false,
          nerd_font_variant = "mono"
        },
        term = {
          enabled = true
        },
  sources = {

    
        providers = {
          minuet = {
            name = "minuet",
            async = true,
            module = "minuet.blink",
            score_offset = 100,
          },
        },
    default = {
      'lsp', 'path', 'minuet',
    }
  },
        cmdline = {
          enabled = false
        },
        signature = {
          enabled = true
        }
      }
  vim.opt.autochdir = true
lvim.plugins = {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {
      keymap = {
        preset = "enter"
      }

    }
  },
  -- {
  --   "github/copilot.vim"
  -- },
  {
    "xzbdmw/colorful-menu.nvim",
    before = { "Saghen/blink.cmp" },
    config = function(_, opts)
      require("colorful-menu").setup({
        -- fallback_highlight = {
        --   kind = {
        --     default = "BlinkCmpItemKindGhostText",
        --     -- default = "BlinkCmpItemKindDefault",
        --   },
        -- },
      })
      -- LazyVim.on_load("blink.cmp", function()
      --   require("colorful-menu").setup({})
      -- end)
      -- require("blink.cmp").setup(bo)
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}
  },
  {
    "sourcegraph/sg.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    opts = {
      enable_cody = true,
      accept_tos = true,
      download_binaries = true,
      lsp = {
        preload_files = true,
      },
    },
  },
  -- { "tpope/vim-surround" },
  -- { "tpope/vim-dispatch" },
  -- { "tpope/vim-endwise" },
  {
    "stevearc/conform.nvim", opts = {}
  },
  {
    "stevearc/dressing.nvim", opts = {}
  },
  {
    "stevearc/overseer.nvim", opts = {}
  },
  {
    "stevearc/aerial.nvim", opts = {}
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    enabled = true,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      auto_suggestions_provider = "copilot",
      hints = { enabled = true },
      file_selector = {
        provider = "telescope",
      },
      dual_boost = {
        enabled = true,
        first_provider = "copilot",
        second_provider = "claude",
      },
      -- mappings = {
      --   ask = prefix .. "<CR>",
      --   edit = prefix .. "e",
      --   refresh = prefix .. "r",
      --   focus = prefix .. "f",
      --   toggle = {
      --     default = prefix .. "t",
      --     debug = prefix .. "d",
      --     hint = prefix .. "h",
      --     suggestion = prefix .. "s",
      --     repomap = prefix .. "R",
      --   },
      --   diff = {
      --     next = "]c",
      --     prev = "[c",
      --   },
      --   files = {
      --     add_current = prefix .. ".",
      --   },
      -- },
      behaviour = {
        auto_suggestions = false,
      },
      provider = "copilot",
      copilot = {
        model = "claude-3.5-sonnet",
        temperature = 0.5,
        max_tokens = 8192,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- dynamically build it, taken from astronvim
    build = "make",
    config = function()
      require("avante_lib").load()
      require("avante").setup({
        copilot = {
          allow_insecure = true,
          model = "claude-3.5-sonnet",
        },
        provider = "copilot",
        auto_suggestions_provider = "copilot",
      })
    end,
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
          -- make sure rendering happens even without opening a markdown file first
          "yetone/avante.nvim",
        },
        opts = function(_, opts)
          opts.file_types = opts.file_types or { "markdown", "norg", "rmd", "org", "mdx" }
          vim.list_extend(opts.file_types, { "Avante" })
        end,
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = true,
    opts = {
      provider = "copilot",
      adapters = {
        opts = {
          allow_insecure = true,
        },
        ollama = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {},
          })
        end,
      },
      opts = {
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
        },

      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {}
  },
  -- MINI ANIMATE
  {
    "echasnovski/mini.bufremove",
    opts = {}
  },
  {
    "echasnovski/mini.hipatterns",
    opts = {}
  },
  {
    "echasnovski/mini.animate",
    opts = {}
  },
  {
    "echasnovski/mini.ai",
    opts = {}
  },
  {
    "echasnovski/mini.bufremove",
    opts = {}
  },
  {
    "echasnovski/mini.indentscope",
    opts = {}
  },
  {
    "CopilotC-nvim/CopilotChat.nvim",
    opts = {}
  },
  {
    "yetone/avante.nvim",
    opts_extend = {
      "sources.providers",
      "sources.default",
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "milanglacier/minuet-ai.nvim",
        enabled = true,
        opts = {
            provider = "openai_fim_compatible",
            n_completions = 1, -- recommend for local model for resource saving
       context_window = 512,
            provider_options = {
              openai_fim_compatible = {
                api_key = "TERM",
                name = "Ollama",
                end_point = "http://localhost:11434/v1/completions",
                model = "deepseek-r1:latest",
                optional = {
                  max_tokens = 256,
                  top_p = 0.9,
                },
              },
            },
        },
            -- Your configuration options here
      },
    },
    ---@param opts blink.cmp.Config
    opts = {
        cmdline = {
          enabled = false
        },
        signature = {
          enabled = true
        },
        appearance = {

        }
      }
  },
  { "LhKipp/nvim-nu", opts = {
    use_lsp_colors = false,
  } },
  { "alaviss/nim.nvim", ft = "nim" },
  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    ft = { "lua" },
    opts = {},
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  },
  {
    "Mythos-404/xmake.nvim",
    version = "^3",
    lazy = true,
    event = "BufReadPost",
    opts = {},
  },
  {
    "Civitasv/cmake-tools.nvim",
    opts = {},
  },
  -- {
  --   "folke/lazydev.nvim",
  --   ft = "lua",
  --   cmd = "LazyDev",
  --   opts = {
  --     integrations = {
  --       lspconfig = true,
  --       cmp = true,
  --       coq = false,
  --     },
  --     runtime = vim.env.VIMRUNTIME,
  --     library = {
  --       { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  --       { path = "LazyVim", words = { "LazyVim" } },
  --       { path = "snacks.nvim", words = { "Snacks" } },
  --       { path = "lazy.nvim", words = { "LazyVim" } },
  --       -- { path = "/Users/clp/down/down.nvim", words = { "down" } },
  --     },
  --   },
  -- },
  {
    enabled = false,
    'Saghen/blink.cmp',
    before = {"xzbdmw/colorful-menu.nvim"},
    version = "*",
    lazy = false,
    dependencies = {
      "xzbdmw/colorful-menu.nvim",
      "rafamadriz/friendly-snippets",
    },
    opts = cc,
    opts_extend = {
      "sources.providers"
    }
  },
  {
    opts = {},
    "sourcegraph/sg.nvim"
  },
  {
    "clpi/down.nvim",
    opts = {

    }
  }
}

local k = vim.keymap.set
local o = { silent = true, nowait = true, noremap = true  }
-- k("i", "<c-j>", "<CMD>call copilot#Next()<CR>", o)
-- k("i", "<c-k>", "<CMD>call copilot#Previous()<CR>", o)
-- k("i", "<c-e>", "<CMD>call copilot#Accept()<CR>", o)
-- k("i", "<c-d>", "<CMD>call copilot#Dismiss()<CR>", o)
-- local cs = require("copilot.suggestion")
-- k("i", "<c-j>", cs.next, o)
-- k("i", "<c-k>", cs.prev, o)
-- k("i", "<c-e>", cs.accept, o)
k({"c", "i"}, "<c-b>", "<LEFT>", o)
k({"c", "i"}, "<c-f>", "<RIGHT>", o)
k({"c", "i"}, "<c-d>", "<DOWN>", o)
k({"c", "i"}, "<c-u>", "<UP>", o)
k({"c", "i"}, "<c-a>", "<HOME>", o)

