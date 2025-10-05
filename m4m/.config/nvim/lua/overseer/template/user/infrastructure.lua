local vim = vim

---@type overseer.Template
return {
	name = "infrastructure run dev",
	builder = function()
		local file = vim.fn.expand("%:p")
		local dir = vim.fn.expand("%:p:h")
		return {
			args = {},
			components = {
				{ "on_output_quickfix", open = true },
			},
			cmd = { "ls" },
		}
	end,
}
