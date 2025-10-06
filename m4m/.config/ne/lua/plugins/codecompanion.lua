return {
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
	},
	extensions = {
		mcphub = {
			callback = "mcphub.extensions.codecompanion",
			opts = {
				make_slash_commands = true,
				show_results_in_chat = true,
				make_vars = true,
			},
		},
	},
}
