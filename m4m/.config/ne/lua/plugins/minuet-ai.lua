return {
	cmp = {
		enable_auto_complete = false,
	},
	blink = {
		enable_auto_complete = false,
	},
	n_completions = 1,
	context_window = 512,
	provider = "openai_compatible",
	provider_options = {
		gemini = {
			open_fim_compatible = {
				name = "Ollama",
				end_point = "http://localhost:11434/v1/completions",
				api_key = os.getenv("OLLAMA_API_KEY"),
				model = "qwen3-coder:480b-cloud",
				optional = {
					max_tokens = 56,
					top_p = 0.9,
				},
			},
			model = "gemini-2.0-flash",
			stream = true,
			api_key = "GEMINI_API_KEY",
			end_point = "https://generativelanguage.googleapis.com/v1beta/models",
		},
		openai_compatible = {
			api_key = "OPENROUTER_API_KEY",
			end_point = "https://openrouter.ai/api/v1/chat/completions",
			model = "moonshotai/kimi-k2",
			name = "OpenRouter (Kimi-K2)",
			optional = {
				max_tokens = 56,
				top_p = 0.9,
				provider = {
					sort = "throughput",
				},
			},
		},
	},
}
