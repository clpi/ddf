vim.cmd[[
cab sn lua Snacks.
cab sp lua Snacks.picker.
cab tl Telescope
cab tr Trouble
cab cpc CopilotChat
cab cc CodeCompanion
cab ae Aerial
cab ov Overseer
cab con Conform
cab cl Claude
]]


vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.Jenkinsfile",
  callback = function()
    vim.opt_local.filetype = "groovy"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.conceallevel = 0
  end,
})
