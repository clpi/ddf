vim.cmd([[
  cabbrev tl Telescope
  cabbrev cch CopilotChat
  cabbrev cp Copilot
]])

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.Jenkinsfile",
	command = "set filetype=groovy",
})
