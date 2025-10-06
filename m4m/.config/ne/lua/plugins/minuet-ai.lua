return {
  cmp = {
    enable_auto_complete = false,
  },
  blink = {
    enable_auto_complete = false,
  },
  provider = "openai_compatible",
  provider_options = {
    gemini = {
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
          sort = "throughput"
        }
      }
    }
  }
}
