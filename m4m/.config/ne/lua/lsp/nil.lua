return {
      name = "nil",
      cmd = { "nil", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ "flake.nix", "default.nix" , "shell.nix"}, { upward = true })[1] or vim.api.nvim_buf_get_name(0)),

}
