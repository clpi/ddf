vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")
local ad = require("codecompanion.adapters")
return {
  -- adapters = {
  --   ollama = function ()
  --
  --     return ad.extend("ollama", {
  --       env = {
  --         url = "https://ollama.com",
  --         api_key = "OLLAMA_API_KEY",
  --       },
  --       headers = {
  --         ["Content-Type"] = "application/json",
  --         ["Authorization"] = "Bearer ${api_key}",
  --       },
  --       parameters = {
  --         sync = true
  --       }
  --     })
  --   end,
  --   opts = {
  --     show_model_choices = true,
  --   }
  -- },
	providers = {
		-- ollama = function ()
		--   return ad.extend("ollama", {
		--     env = {
		--       url = "https://ollama.com",
		--       api_key = "OLLAMA_API_KEY",
		--     },
		--     headers = {
		--       ["Content-Type"] = "application/json",
		--       ["Authorization"] = "Bearer ${api_key}",
		--     },
		--     parameters = {
		--       sync = true
		--     }
		--   })
		-- end,
		-- acp = {
		-- 	claude_code = function()
		-- 		return ad.extend("claude_code", {
		-- 			env = {
		-- 				CLAUDE_CODE_OAUTH_TOKEN = os.getenv("ANTHROPIC_API_KEY"),
		-- 			},
		-- 		})
		-- 	end,
		-- opts = {
		-- 	show_model_choices = true,
		-- 	show_defaults = false,
		-- },
		-- },
	},
	strategies = {
    cmd = {
      adapter = "copilot",
    },
		chat = {
			name = "copilot",
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
	},
	memory = {
		default = {
			description = "Code Companion Memory",
			files = {
				".cursorrules",
				".clinerules",
				"AGENTS.md",
				"AGENT.md",
				{ path = "CLAUDE.md", parser = "claude" },
				{ path = "~/.claude/CLAUDE.md", parser = "claude" },
			},
		},
	},
	opts = {
		chat = {
			enabled = true,
		},
		log_level = "DEBUG",
	},
	extensions = {
		-- vectorcode = {
		-- 	---@type VectorCode.CodeCompanion.ExtensionOpts
		-- 	opts = {
		-- 		tool_group = {
		-- 			enabled = true,
		-- 			extras = {},
		-- 			collapse = false,
		-- 		},
		-- 		tool_opts = {
		-- 			---@type VectorCode.CodeCompanion.ToolOpts
		-- 			["*"] = {},
		-- 			---@type VectorCode.CodeCompanion.LsToolOpts
		-- 			ls = {},
		-- 			---@type VectorCode.CodeCompanion.VectoriseToolOpts
		-- 			vectorise = {},
		-- 			files_ls = {},
		-- 			files_rm = {},
		-- 			query = {
		-- 				use_lsp = true,
		-- 				include_stderr = true,
		-- 				summarise = {
		-- 					enabled = false,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- },
	-- mcphub = {
	-- 	callback = "mcphub.extensions.codecompanion",
	-- 	opts = {
	-- 		make_tools = true,
	-- 		add_mcp_prefix_to_fool_names = true,
	-- 		format_tool = nil,
	-- 		make_slash_commands = true,
	-- 		show_results_in_chat = true,
	-- 		make_vars = true,
	-- 	},
	-- },
	 	},
}
