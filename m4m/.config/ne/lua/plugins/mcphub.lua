return {
  auto_approve = true,
	workspace = {
		enabled = true,
	},
	extensions = {
		copilotchat = {
			convert_tools_to_functions = true,
			convert_resources_to_functions = true,
			add_mcp_prefix = true,

			enabled = true,
		},
		avante = {
			make_slash_commands = true,
		},
    codecompanion = {

    },
	},
	port = 37373,
	builtin_tools = {
		edit_file = {
			parser = {
				extract_inline_content = true,
				track_issues = true,
			},
		},
	},
	config = vim.fn.expand("~/.config/mcphub/servers.json"),
}
