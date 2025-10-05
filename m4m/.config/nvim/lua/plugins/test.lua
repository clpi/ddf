return {
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup({
				dap = true,
				strategy = {
					"toggleterm",
					use_shell = true,
					hidden = false,
				},
				templates = {
					"builtin",
					"user.ansible",
					"user.jenkins",
					"user.terraform",
					"user.infrastructure",
				},
			})
			require("overseer").enable_dap()
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"fredrikaverpil/neotest-golang",
			"leoluz/nvim-dap-go",
		},
		config = function()
			require("neotest").setup({
				consumers = {
					overseer = require("neotest.consumers.overseer"),
				},
				overseer = {
					enabled = true,
					force_default = true,
				},
				adapters = {
					require("neotest-golang")({
						dap = { justMyCode = false },
					}),
				},
			})

			vim.keymap.set("n", "<leader>tr", function()
				require("neotest").run.run({
					suite = false,
					testify = true,
				})
			end, { desc = "Debug: Running Nearest Test" })

			vim.keymap.set("n", "<leader>tv", function()
				require("neotest").summary.toggle()
			end, { desc = "Debug: Summary Toggle" })

			vim.keymap.set("n", "<leader>ts", function()
				require("neotest").run.run({
					suite = true,
					testify = true,
				})
			end, { desc = "Debug: Running Test Suite" })

			vim.keymap.set("n", "<leader>td", function()
				require("neotest").run.run({
					suite = false,
					testify = true,
					strategy = "dap",
				})
			end, { desc = "Debug: Debug Nearest Test" })

			vim.keymap.set("n", "<leader>to", function()
				require("neotest").output.open()
			end, { desc = "Debug: Open test output" })

			vim.keymap.set("n", "<leader>ta", function()
				require("neotest").run.run(vim.fn.getcwd())
			end, { desc = "Debug: Open test output" })
		end,
	},
}
