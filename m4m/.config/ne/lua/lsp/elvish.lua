-- vim.cmd.commentstring
---@type vim.lsp.Config
return {
  cmd = { "elvish", "-lsp"},

  name = "elvish-lsp",
  workspace_folders = {
    {
      name = "rc",
      uri = vim.fn.expand("~/.elvish"),
    }
  },
  filetypes = { "elvish" },
  settings = {

  }
}
