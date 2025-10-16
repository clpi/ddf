---@type vim.lsp.Config
return {
  cmd = { "codeql", "execute", "language-server", "--check-errors", "ON_CHANGE", "-q"},
  filetypes = {"ql"},

}
