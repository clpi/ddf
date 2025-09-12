-- lvim.builtin
-- -- Read the docs: https://www.lunarvim.org/docs/configuration
-- -- Example configs: https://github.com/LunarVim/starter.lvim
-- -- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- -- Forum: https://www.reddit.com/r/lunarvim/
-- -- Discord: https://discord.com/invite/Xb9B4Ny,
lvim.builtin.mason.install_root_dir = "/Users/clp/.local/share/nvim/mason"
-- require("")

lvim.format_on_save = true
-- local b = require"codecompanion.providers.completion.blink"

-- lvim.
lvim.builtin.lir.active = false
lvim.builtin.cmp.window.documentation = {
  border = "none",
  winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
  col_offset = -3,
  side_padding = 1,
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.context_commentstring.enable_autocmd = true
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = true
lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.terminal.open_mapping = [[<C-O>]]
lvim.builtin.lualine.options.icons_enabled = true
-- lvim.builtin.lualine.tabline = {

-- }

local bc = {
  "saghen/blink.cmp",
  version = "*",
  build = "cargo build --release",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.providers",
    "sources.compat",
    "sources.default",
  },
  dependencies = {
    "stevearc/oil.nvim",
    "xzbdmw/colorful-menu.nvim",
    "rafamadriz/friendly-snippets",
    -- add blink.compat to dependencies
    -- {
    --   "saghen/blink.compat",
    --   optional = true, -- make optional so it's only enabled if any extras need it
    --   opts = {},
    -- },
  },
  event = "InsertEnter",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },
    completion = {
      menu = {
        auto_show = true,
        enabled = true,
        winblend = 12,
        -- max_height = 0,

        border = 'none',
        -- max_height = 0,
        draw = {
          align_to = "label",
          columns = { { "kind_icon" }, { "label", gap = 1 }, { "label_description" } },
          components = {
            label = {
              ellipsis = true,
              width = { fill = true, max = 60 },
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
                -- local highlights_info = require("colorful-menu").blink_highlights(ctx)
                -- if highlights_info ~= nil then
                --     -- Or you want to add more item to label
                --     return highlights_info.label
                -- else
                --     return ctx.label
                -- end
              end,
              highlight = function(ctx)
                local highlights = {}
                local bch = require("colorful-menu").blink_components_highlight(ctx)
                if bch then highlights = bch end
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                end
                -- Do something else
                return highlights
              end,
            },
          },
          treesitter = {
            'lsp',
          },
          -- components = {
          --   {

          --   }
          --   -- 'kind',
          --   -- 'abbr',
          --   -- 'menu',
          -- }

        }
      },
      documentation = {
        auto_show = true,
        -- auto_show_delay_ms = 0,
        treesitter_highlighting = true,
        -- update_delay_ms = 0,
        -- draw = function(o)
        --   o.default_implementation
        -- end,
        window = {
          winblend = 10,
          scrollbar = true,
          border = "none"
        },
      },
      accept = {
        create_undo_point = true,
        dot_repeat = true,
        -- experimental auto-brackets support
        auto_brackets = {
          semantic_token_resolution = {
            enabled = true,
          },
          kind_resolution = {
            enabled = true,
          },
          enabled = true,
        },
      },
      keyword = {
        range = 'full'
      },
      list = {
        cycle = {
          from_bottom = true,
          from_top = true
        },
        selection = {
          auto_insert = true,
          preselect = function(c)
            return c.mode == 'default' or c.mode == 'default'
          end
        },
      },
      trigger = {
        show_on_accept_on_trigger_character = true,
        show_on_keyword = true,
        show_in_snippet = true,
        show_on_insert_on_trigger_character = true,
        show_on_trigger_character = true,
      },
      ghost_text = {
        enabled = false,
        show_with_selection = false,
        show_without_selection = false,
      },
    },
    fuzzy = {

      use_frecency = true,
      use_proximity = true,
    },
    signature = {
      window = {
        show_documentation = true,
        treesitter_highlighting = true,
        winblend = 10,
        border = 'none'
      },
      enabled = true,
      trigger = {
        enabled = true,
        show_on_insert = true,
        show_on_keyword = true,
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
      }
    },

    -- experimental signature help support
    -- signature = { enabled = true },

    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      default = { 'lazydev', "lsp", "path", "snippets", "omni" },
      providers = {
        lazydev = {
          name = "Lazydev",
          module = "lazydev.integrations.blink",
          -- async = true,
          score_offset = 100,
        }

      }
    },

    cmdline = {
      completion = {
        menu = {
          auto_show = true,
          draw = {
          }
        }
      },
      enabled = false,
    },

    keymap = {
      preset = "enter",
      -- ["<C-j>"] = {
      --   function()
      --     if true then

      --     end
      --   end
      -- },
      -- ["<C-e>"] = {
      -- function(c)
      --     vim.print(c)
      -- end,
      -- },

      ["<C-y>"] = { "select_and_accept" },
    },
  },
  ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
  config = function(_, opts)
    -- setup compat sources
    local enabled = opts.sources.default
    for _, source in ipairs(opts.sources.compat or {}) do
      opts.sources.providers[source] = vim.tbl_deep_extend(
        "force",
        { name = source, module = "blink.compat.source" },
        opts.sources.providers[source] or {}
      )
      if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
        table.insert(enabled, source)
      end
    end


    -- Unset custom prop to pass blink.cmp validation
    opts.sources.compat = nil

    -- check if we need to override symbol kinds
    for _, provider in pairs(opts.sources.providers or {}) do
      ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
      if provider.kind then
        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
        local kind_idx = #CompletionItemKind + 1

        CompletionItemKind[kind_idx] = provider.kind
        ---@diagnostic disable-next-line: no-unknown
        CompletionItemKind[provider.kind] = kind_idx

        ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
        local transform_items = provider.transform_items
        ---@param ctx blink.cmp.Context
        ---@param items blink.cmp.CompletionItem[]
        provider.transform_items = function(ctx, items)
          items = transform_items and transform_items(ctx, items) or items
          for _, item in ipairs(items) do
            item.kind = kind_idx or item.kind
          end
          return items
        end

        -- Unset custom prop to pass blink.cmp validation
        provider.kind = nil
      end
    end

    require("blink.cmp").setup(opts)
  end,
}
lvim.builtin.cmp.window.completion = {
  border = "none",
  winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
  col_offset = -3,
  side_padding = 1,
}
lvim.builtin.cmp.mapping["<tab>"] = nil
lvim.builtin.cmp.mapping["<s-tab>"] = nil
lvim.builtin.cmp.enabled = false

vim.cmd [[
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
    preset = "",
    ["<A-y>"] = {
      function(cmp)
        cmp.show({ providers = { "minuet" } })
      end,
    },
  },
  fuzzy = {
    use_frecency = true,
    use_proximity = true,
  },
  completion = {

    menu = {
      auto_show = true,
      enabled = true,
      winblend = 12,
      -- max_height = 0,

      border = 'none',
      draw = {
        treesitter = {
          'lsp',
        },
        components = {

        },
        columns = {
          { 'kind_icon',   'kind' },
          { 'label',       'label_description', gap = 1 },
          { 'label_detail' },
          { 'source_name' }
        }

      }
    },
    documentation = {
      auto_show = true,
      -- auto_show_delay_ms = 0,
      treesitter_highlighting = true,
      -- update_delay_ms = 0,
      -- window = {
      --   winblend = 10,

      --   border = "none"
      -- },
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
    -- compl



    providers = {
      minuet = {
        name = "minuet",
        async = true,
        module = "minuet.blink",
        score_offset = 100,
      },
    },
    default = {
      'lsp', 'path'
    }
  },
  cmdline = {
    keymap = {
      ["<CR>"] = { 'accept_and_enter', 'fallback' }
    },
    enabled = false
  },
  signature = {
    enabled = true
  }
}
vim.opt.autochdir = true
vim.g.icloud = "/Users/clp/Library/Mobile Documents/com~apple~CloudDocs"
vim.g.wiki_templates = "/wiki/templates"
vim.g.homed = "/Users/clp/d"
vim.g.homea = "/Users/clp/a"
vim.g.homeb = "/Users/clp/b"
vim.g.homec = "/Users/clp/c"
lvim.plugins = {
  bc,
  -- {
  --   "nvim-orgmode/orgmode.nvim",
  --   opts = {}
  -- },
  --
  --
  {
    "vimwiki/vimwiki",
    branch = "dev",
    lazy = false,
    keys = {
      {
        "<leader>wi",
        function()
          vim.cmd("VimwikiIndex")
        end,
        desc = "Open Vimwiki Index",
      },
      {
        "<leader>w<tab>",
        function()
          vim.cmd("VimwikiTabIndex")
        end,
        desc = "Open Vimwiki Tab Index",
      },
      {
        "<leader>wf",
        function()
          vim.cmd("VimwikiSearch")
        end,
        desc = "Search Vimwiki",
      },
      {
        "<leader>wl",
        function()
          vim.cmd("VimwikiList")
        end,
        desc = "List Vimwiki",
      },
      {
        "<leader>wn",
        function()
          vim.cmd("VimwikiNew")
        end,
        desc = "New Vimwiki Page",
      },
      {
        "<leader>wd",
        function()
          vim.cmd("VimwikiDiaryIndex")
        end,
        desc = "Open Vimwiki Diary Index",
      },
      {
        "<leader>wD",
        function()
          vim.cmd("VimwikiDiaryGenerateLinks")
        end,
        desc = "Generate Vimwiki Diary Links",
      },
      {
        "<leader>wN",
        function()
          vim.cmd("VimwikiToggleList")
        end,
        desc = "Toggle Vimwiki List",
      },
      {
        "<leader>wh",
        function()
          vim.cmd("VimwikiToggleHeader")
        end,
        desc = "Toggle Vimwiki Header",
      },
      {
        "<leader>w<space>",
        function()
          vim.cmd("VimwikiMakeDiaryNote")
        end,
        desc = "Make diary note",
      },
      {
        "<leader>wt",
        function()
          vim.cmd("VimwikiMakeTomorrowDiaryNote")
        end,
        desc = "Make tomorrow diary note",
      },
      {
        "<leader>wy",
        function()
          vim.cmd("VimwikiMakeYesterdayDiaryNote")
        end,
        desc = "Make yesterday diary note",
      },
      {
        ",w,",
        function()
          vim.cmd("VimwikiMakeDiaryNote")
        end,
        desc = "Make diary note",
      },
      {
        ",wt",
        function()
          vim.cmd("VimwikiMakeTomorrowDiaryNote")
        end,
        desc = "Make tomorrow diary note",
      },
      {
        ",wy",
        function()
          vim.cmd("VimwikiMakeYesterdayDiaryNote")
        end,
        desc = "Make yesterday diary note",
      },
    },
    init = function()
      vim.g.vimwiki_list = {
        {
          template_path = vim.g.icloud .. "/wiki/templates",
          syntax = "markdown",
          ext = ".md",
          path = vim.g.icloud .. "/wiki",
        },
        {
          template_path = "/Users/clp/wiki/templates",
          syntax = "markdown",
          ext = ".md",
          path = "/Users/clp/wiki",
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
  },
  -- {
  --   "Shatur/neovim-ayu",
  --   config = function()
  --     require("ayu").setup({

  --     })
  --   end,
  -- },
  {
    enabled = true,
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "RRethy/nvim-treesitter-endwise",
    config = function()
      require("nvim-treesitter.configs").setup({
        endwise = {
          enable = true,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("copilot").setup({


      })
    end,
  },
  -- {
  --   "github/copilot.vim"
  -- },
  {
    "folke/neoconf.nvim",
    opts = {



    }
  },
  {
    "folke/lsp-colors.nvim",
    opts = {}
  },
  {
    "xzbdmw/colorful-menu.nvim",
    before = {
      "saghen/blink.cmp",
    },
    config = function(_, opts)
      require("colorful-menu").setup({
        -- ls = {

        -- }
        -- fallback_highlight = "BlinkCmpItemKindGhostText",
        fallback_highlight = "BlinkCmpItemKindDefault",
        max_width = 100,
        -- ls = {}
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
  --   -- { "tpope/vim-surround" },
  --   -- { "tpope/vim-dispatch" },
  --   -- { "tpope/vim-endwise" },
  -- {
  --   "stevearc/conform.nvim", opts = {}
  -- },
  {
    "stevearc/dressing.nvim", opts = {}
  },
  -- {
  --   "stevearc/overseer.nvim", opts = {}
  -- },
  {
    "stevearc/aerial.nvim", opts = {}
  },
  {
    "yetone/avante.nvim",
    -- event = "VeryLazy",
    -- lazy = true,
    -- enabled = true,
    -- version = false, -- set this if you want to always pull the latest change
    -- opts = {
    --   -- auto_suggestions_provider = "copilot",
    --   hints = { enabled = true },
    --   file_selector = {
    --     provider = "telescope",
    --   },
    --   -- dual_boost = {
    --   --   enabled = true,
    --   --   first_provider = "copilot",
    --   --   second_provider = "claude",
    --   -- },
    --   -- mappings = {
    --   --   ask = prefix .. "<CR>",
    --   --   edit = prefix .. "e",
    --   --   refresh = prefix .. "r",
    --   --   focus = prefix .. "f",
    --   --   toggle = {
    --   --     default = prefix .. "t",
    --   --     debug = prefix .. "d",
    --   --     hint = prefix .. "h",
    --   --     suggestion = prefix .. "s",
    --   --     repomap = prefix .. "R",
    --   --   },
    --   --   diff = {
    --   --     next = "]c",
    --   --     prev = "[c",
    --   --   },
    --   --   files = {
    --   --     add_current = prefix .. ".",
    --   --   },
    --   -- },
    --   behaviour = {
    --     auto_suggestions = false,
    --   },
    --   provider = "copilot",
    -- },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- dynamically build it, taken from astronvim
    build = "make",
    config = function()
      require("avante_lib").load()
      require("avante").setup( ---@type avante.Config
        {
          copilot = {
            model = "claude-3.5-sonnet",
            temperature = 0.5,
            max_tokens = 8192,
            allow_insecure = true,
          },
          provider = "copilot",
          behaviour = {
            auto_suggestions = true,
          },
          suggestion = {



          },
          web_search_engine = {},
          -- behaviour = {
          --   auto_suggestions = false,
          -- },
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
          --     -- add_current = "" .. ".",
          --   },
          -- },
          auto_suggestions_provider = "copilot",
          hints = { enabled = true },
          file_selector = {
            provider = "telescope",
          },
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
    lazy = false,
    event = "VeryLazy",
    keys = {
      {
        "gsa",
        function()
          require("treesitter-context").go_to_context(0)
        end,
        desc = "go to sticky scroll",
      },
      {
        "gs",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "go to sticky scroll",
      },
      {
        "gsd",
        function()
          require("treesitter-context").go_to_context(1)
        end,
        desc = "go to sticky scroll",
      },
    },
    opts = {
      enable = true,             -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 3,             -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 2,     -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 100, -- Maximum number of lines to show for a single context
      trim_scope = "outer",      -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor",           -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 31,     -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
  },

  --   -- MINI ANIMATE
  {
    "echasnovski/mini.snippets",
    opts = {}
  },
  {
    "echasnovski/mini.doc",
    opts = {
      default_section_id = "",
      silent = false,
    }
  },
  {
    "echasnovski/mini.snippets",
    opts = {
    }
  },
  {
    "echasnovski/mini.snippets",
    opts = {}
  },
  {
    "echasnovski/mini.cursorword",
    opts = {
      delay = 100
    }
  },
  {
    "echasnovski/mini.bufremove",
    opts = {
      set_vim_settings = true,
      silent = false
    }
  },
  {
    "echasnovski/mini.hipatterns",
    opts = {}
  },
  {
    "echasnovski/mini.animate",
    opts = {
      duration = 10


    }
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
  -- { "yetone/avante.nvim",
  -- },
  {
    "LhKipp/nvim-nu",
    ft = "nu",
    opts = {
      use_lsp_colors = false,
    }
  },
  { "alaviss/nim.nvim", ft = "nim" },
  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    ft = { "lua" },
    opts = {},
    keys = {
      { "<leader>v",  ft = "lua",          desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>",  ft = "lua",   desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua",   desc = "Stop LÖVE" },
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
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",

    opts = {

      integrations = {
        lspconfig = true,
        cmp = false,
        coq = false,
      },
      runtime = vim.env.VIMRUNTIME,
      library = {
        { path = "${3rd}/luv/library",                        words = { "vim%.uv" } },
        { path = "/Users/clp/.local/share/lunarvim/lvim/lua", words = { "lvim" } },
        -- { path = "LazyVim", words = { "LazyVim" } },
        -- { path = "snacks.nvim", words = { "Snacks" } },
        -- { path = "lazy.nvim", words = { "LazyVim" } },
        { path = "/Users/clp/down/down.nvim",                 words = { "down" } },
      },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {}
  },
  -- {
  --   enabled = true,
  --   'Saghen/blink.cmp',
  --   after = {"xzbdmw/colorful-menu.nvim"},
  --   version = "*",
  --   lazy = false,
  --   dependencies = {
  --     "xzbdmw/colorful-menu.nvim",
  --     "rafamadriz/friendly-snippets",
  --   },
  --   -- opts = cc,
  -- opts_extend = {
  --   "sources.completion.enabled_providers",
  --   "sources.compat",
  --   "sources.default",
  -- },
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --     -- add blink.compat to dependencies
  --     {
  --       "saghen/blink.compat",
  --       optional = true, -- make optional so it's only enabled if any extras need it
  --       opts = {},
  --       version = not vim.g.lazyvim_blink_main and "*",
  --     },
  --   },
  --   event = "InsertEnter",

  --   opts_extend = {
  --     "sources.providers",
  --     "sources.default",
  --     "sources.compat"
  --   }
  -- },
  {
    dir = "~/d/down.nvim",
    opts = {

    },
    version = false,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config({ virtual_text = false })
    end,
  },

  {
    "yarospace/lua-console.nvim",
    lazy = true,
    keys = { "`", "<Leader>`" },
    ft = { "lua" },
    opts = {
      buffer = {
        autosave = true,
        preserve_context = true,
        load_on_start = true,
      },
      window = {
        height = 0.45,
        anchor = "SE",
        style = "minimal",
        border = "single",
        title_pos = "left",
      },
      mappings = {
        help = "?",
        quit = "q",
        open = "-o",
        messages = "-m",
        save = "-s",
        load = "-l",
        attach = "-a",
        toggle = "`",
        eval = "<CR>",
        eval_buffer = "<S-CR>",
      },
    },
  },
}

--       {
--         "milanglacier/minuet-ai.nvim",
--         enabled = true,
--         opts = {
--             provider = "openai_fim_compatible",
--             n_completions = 1, -- recommend for local model for resource saving
--        context_window = 512,
--             provider_options = {
--               openai_fim_compatible = {
--                 api_key = "TERM",
--                 name = "Ollama",
--                 end_point = "http://localhost:11434/v1/completions",
--                 model = "deepseek-r1:latest",
--                 optional = {
--                   max_tokens = 256,
--                   top_p = 0.9,
--                 },
--               },
--             },
--         },
--             -- Your configuration options here
--       },
--     }
-- }
local k = vim.keymap.set
local o = { silent = true, nowait = true, noremap = true }
-- k("i", "<c-j>", "<CMD>call copilot#Next()<CR>", o)
-- k("i", "<c-k>", "<CMD>call copilot#Previous()<CR>", o)
-- k("i", "<c-e>", "<CMD>call copilot#Accept()<CR>", o)
local cs = require("copilot.suggestion")
local cp = require("copilot.panel")
k("i", "<c-j>", cs.next, o)
k("i", "<c-k>", cs.prev, o)
k("i", "<c-o>", cp.open, o)
k("i", "<c-y>", cp.refresh, o)
k("i", "<c-u>", cp.accept, o)
k("i", "<D-[>", cp.jump_next, o)
k("i", "<D-]>", cp.jump_prev, o)
-- k("i", "<c-e>", cs.accept, o)
k({ "c", "i" }, "<c-b>", "<LEFT>", o)
k({ "c", "i" }, "<c-f>", "<RIGHT>", o)
k({ "c", "i" }, "<c-d>", "<DOWN>", o)
k({ "c", "i" }, "<c-u>", "<UP>", o)
k({ "c", "i" }, "<c-a>", "<HOME>", o)

-- opts_extend = {
--   "sources.providers",
--   "sources.default",
-- },
-- dependencies = {
--   "MunifTanjim/nui.nvim",
--   {
--     "milanglacier/minuet-ai.nvim",
--     enabled = true,
--     opts = {
--         provider = "openai_fim_compatible",
--         n_completions = 1, -- recommend for local model for resource saving
--    context_window = 512,
--         provider_options = {
--           openai_fim_compatible = {
--             api_key = "TERM",
--             name = "Ollama",
--             end_point = "http://localhost:11434/v1/completions",
--             model = "deepseek-r1:latest",
--             optional = {
--               max_tokens = 256,
--               top_p = 0.9,
--             },
--           },
--         },
--     },
--         -- Your configuration options here
--   },
-- },
-- ---@param opts blink.cmp.Config
-- opts = {
--     cmdline = {
--       enabled = false
--     },
--     signature = {
--       enabled = true
--     },
--     appearance = {

--     }
--   }
-- vim.cmd[[colorscheme ayu]]
-- lvim.colorscheme = 'ayu'
vim.cmd [[color  tokyonight-moon]]

vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
lvim.colorscheme = "tokyonight-storm"
k('n', '<tab>', vim.diagnostic.goto_next)
k('n', '<s-tab>', vim.diagnostic.goto_prev)
vim.opt.wrap = true
k('n', 'gd', vim.lsp.buf.declaration, {})

local cs = require('copilot.suggestion')
locp = require('copilot.panel')
local av = require('avante.suggestion')
local cm = require('codecompanion')
local bl = require("blink-cmp")
local bb = require("blink.cmp")
local sg = require("sg")

function table:has(k)
  return vim.tbl_contains(k)
end

---@alias viskind 'copilot'|'blink'|'avante',
---@alias viskind.blink 'doc'|'sig'|'any'|'ghost'|'menu'
---@alias viskind.copilot 'panel'|'suggestion'
---@class visopts: tablelib
---  @field copilot? viskind.copilot[]
---  @field kind viskind[]
---  @field blink? viskind.blink[]
---  @field fn fun()
---}
---
---@param o viskind.blink[]
local function blink_vis(o)
  ---@cast o +table, +tablelib
  return bl.is_visible() and (
    o:has 'any'
    or (bl.is_documentation_visible() and o:has 'doc')
    or (bl.is_ghost_text_visible() and o:has 'ghost')
    or (bl.is_menu_visible() and o:has 'menu')
    or (bl.is_signature_visible() and o:has 'sig'))
end
---@param o visopts
local function on_visible(o)
  if table.has(o.kind, 'copilot') and cs.is_visible()
      or table.has(o.kind, 'blink') and blink_vis(o.blink or {})
      or table.has(o.kind, 'avante') and av:is_visible() then
    o.fn(); return true
  end
  return false
end
vim.o.foldenable = false
vim.o.pumheight = 0
