---@type vim.lsp.Config
return {
  root_dir = function(f) ---@param f string?
    f = vim.fs.dirname(vim.fs.find(".git", { path = f, upward = true })[1] or f) or f
  end,
  docs = {
    description = [[
    https://github.com/nushell/nushell

    Nushell built-in language server.
    ]],
  },
  name = "nu-lsp",
  cmd = { "nu", "--lsp"},
  settings = {
  },
  filetypes = { "nu" },
  meta = {
    url = "https://www.nushell.sh",
    description = "Nu Language Server",
  },
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 150,
    exit_timeout = 5000,
  }

}
