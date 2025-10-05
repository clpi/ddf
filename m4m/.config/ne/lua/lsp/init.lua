vim.lsp.config("lua_ls", require("lsp.lua"))
vim.lsp.config("bashls", require("lsp.bashls"))
vim.lsp.config("yamlls", require("lsp.yamlls"))
vim.lsp.config("helm_ls", require("lsp.helm_ls"))
vim.lsp.config("gopls", require("lsp.gopls"))
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})
