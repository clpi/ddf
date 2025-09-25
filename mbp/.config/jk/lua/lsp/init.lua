  local dp = vim.fs.dirname(vim.fn.stdpath("data"))
  local l = require("lspconfig")

  require("mason").setup({
    install_root_dir = "/Users/clp/.local/share/nvim/mason"
  })

  require("mason-lspconfig").setup{
    ensure_installed = {
      "clangd", "lua_ls", "jsonls", "kotlin_language_server", "gopls",
      "lemmy-help", "emmylua_ls",
      "rust_analyzer", "zls", "ts_ls", "pyright",
      "nimlangserver", "julials", "yamlls", "vls", "taplo", "denols",
    },
  }
  l.nushell.setup{}
  l.fish_lsp.setup{}
  l.biome.setup{}
  -- l.llm_ls.setup({})
  l.flow.setup({})
  require("lsp.lua").setup()
  require("lsp.ai").setup()
  require("mason-lspconfig").setup_handlers({
    lua_ls = require("lsp.lua").seteup,
   clangd = function()l.clangd.setup({}) end,
    luau_lsp = function() l.luau_lsp.setup({}) end,
   jsonls = function() l.jsonls.setup({})end,
    zls = function() l.zls.setup({})end,
    -- ['kotlin_language_server'] = function() l['kotlin_language_server'].setup{ } end,
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
    texlab = function() l.texlab.setup{} end,
    protols = function() l.protols.setup{} end,
    bashls = function() l.bashls.setup{} end,
    volar = function() l.volar.setup{} end,
    vimls = function() l.vimls.setup{} end,
    fennel_ls = function() l.fennel_ls.setup{} end,
    omnisharp = function() l.omnisharp.setup{} end,
    ols = function() l.ols.setup{} end,
    sqls = function() l.sqls.setup{} end,
    vls = function() l.vls.setup{} end,
    ts_ls = function() l.ts_ls.setup{} end,
    nimlangserver = function() l.nimlangserver.setup{} end,
    serve_d = function() l.serve_d.setup{} end,
    nil_ls = function() l.nil_ls.setup{} end,
    html = function() l.html.setup{} end,
    julials = function() l.julials.setup{} end,
    clojure_lsp = function() l.clojure_lsp.setup{} end,
    cssls = function() l.cssls.setup{} end,
    asm_lsp  = function() l.asm_lsp.setup{} end,
    yamlls = function() l.yamlls.setup{} end,

  })
