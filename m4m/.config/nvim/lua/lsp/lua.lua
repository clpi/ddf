---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      runtime = {
        version = "Lua 5.4",
      },
      completion = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
      workspace = {
        library = { vim.env.RUNTIME },
        checkThirdParty = false,
      },
    },
  },
}
