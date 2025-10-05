return {

	{ "Exafunction/windsurf.vim", enabled = false },
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = { "Copilot" },
		event = "InsertEnter",
		enabled = false,
		opts = {},
		keys = {
			{ "<leader>ca", "<cmd>Copilot panel<cr>", desc = "Open Copilot panel" },
			{ "<leader>cc", "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot" },
			{ "<leader>cg", "<cmd>Copilot github<cr>", desc = "Open Copilot GitHub" },
		},
	},
	{ "github/copilot.vim", enabled = true },
	{ "Exafunction/windsurf.nvim", enabled = true },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
			{
				"MeanderingProgrammer/render-markdown.nvim",
				ft = { "markdown", "Avante", "copilot-chat" },
				opts = { file_types = { "markdown", "Avante", "copilot-chat" } },
			},
		},
		-- cmd = { "CopilotChat" },
		build = "make tiktoken",
		-- keys = {
		-- 	{ "<leader>cc", "<CMD>CopilotChat<CR>", desc = "Toggle copilotchat" },
		-- 	{ "<leader>cm", "<CMD>CopilotChatModels<CR>", desc = "Select model" },
		-- 	{ "<leader>cp", "<CMD>CopilotChatPrompt<CR>", desc = "Select prompt" },
		-- },
		opts = {
			model = "gpt-4.1",
			temperature = 0.1,
			auto_insert_mode = true,
			window = {
				width = 0.5,
				layout = "vertical",
			},
		},
		-- 	config = function(...)
		-- 		vim.api.nvim_create_autocmd("BufEnter", {
		-- 			pattern = "copilot-*",
		-- 			callback = function()
		-- 				vim.opt_local.relativenumber = false
		-- 				vim.opt_local.number = false
		-- 				vim.opt_local.conceallevel = 0
		-- 			end,
		-- 		})
		-- 	end,
	},
}
