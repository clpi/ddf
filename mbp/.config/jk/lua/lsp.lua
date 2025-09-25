  local dp = vim.fs.dirname(vim.fn.stdpath("data"))
  local l = require("lspconfig")
  local lspaisettings = {
    memory = {
      file_store = {}
    },
    completion = {
      model = "qwen2.5-coder",
      type = "ollama",
      parameters = {
        max_tokens = 32,
        max_context = 1024,
      }
    },
    models = {
      ["deepseek-r1"] = {
        type = "ollama",
        model = "deepseek-r1:latest"
      },
      ["qwen2.5-coder"] = {
        type = "ollama",
        model = "qwen2.5-coder:latest"
      }
    }
  }
  local luasettings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = { enable = false },
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    }

  require("mason").setup{
    install_root_dir = vim.fs.joinpath(vim.fs.dirname(vim.fn.stdpath("data")), "mason"),
  }

  require("mason-lspconfig").setup{
    ensure_installed = {
      "clangd", "lua_ls", "jsonls", "kotlin_language_server", "gopls",
      "rust_analyzer", "zls", "ts_ls", "pyright",
      "nimls", "julials", "yamlls", "vls", "taplo", "denols",
    },
  }
local function luals() 
    l.lua_ls.setup({
    settings = luasettings,
    on_init = function(c)
      local path = c.workspace_folders[1].name
      if c.workspace_folders then
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          return
        end
      end
      c.config.settings.Lua = vim.tbl_deep_extend('force', c.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT'
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,

          }
        }
      })
    end
  }) end
  l.nushell.setup{}
  l.fish_lsp.setup{}
  luals()
  -- l.llm_ls.setup({})
  l.flow.setup({})
  l.lsp_ai.setup({ settings = lspaisettings })
  require("mason-lspconfig").setup_handlers({
    lua_ls = luals,
   clangd = function()l.clangd.setup({}) end,
    luau_lsp = function() l.luau_lsp.setup({}) end,
   jsonls = function() l.jsonls.setup({})end,
    zls = function() l.zls.setup({})end,
    ['kotlin_language_server'] = function() l['kotlin_language_server'].setup{ } end,
    gopls = function() l.gopls.setup{} end,
    ruff = function() l.ruff.setup{} end,
    svelte = function() l.svelte.setup{} end,
    buf_ls = function() l.buf_ls.setup{} end,
    purescriptls = function() l.purescriptls.setup{} end,
    -- ast_grep=function()l.ast_grep.setup{} end,
    v_analyzer = function() l.v_analyzer.setup{} end,
    taplo = function() l.taplo.setup{} end,
    denols = function() l.denols.setup{} end,
    pyright = function() l.pyright.setup{} end,
    teal_ls = function() l.teal_ls.setup{} end,
    basedpyright = function() l.basedpyright.setup{} end,
    tinymist = function() l.tinymist.setup{} end,
    bashls = function() l.bashls.setup{} end,
    volar = function() l.volar.setup{} end,
    vimls = function() l.vimls.setup{} end,
    fennel_ls = function() l.fennel_ls.setup{} end,
    ols = function() l.ols.setup{} end,
    sqls = function() l.sqls.setup{} end,
    vls = function() l.vls.setup{} end,
    ts_ls = function() l.ts_ls.setup{} end,
    nimls = function() l.nimls.setup{} end,
    serve_d = function() l.serve_d.setup{} end,
    nil_ls = function() l.nil_ls.setup{} end,
    html = function() l.html.setup{} end,
    julials = function() l.julials.setup{} end,
    clojure_lsp = function() l.clojure_lsp.setup{} end,
    cssls = function() l.cssls.setup{} end,
    asm_lsp  = function() l.asm_lsp.setup{} end,
    yamlls = function() l.yamlls.setup{} end,

  })
