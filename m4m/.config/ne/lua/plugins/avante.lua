return {
  web_search_engine = {
    provider = "tavily",
    api_key_name = "TAVILY_API_KEY"
  },
  mode = "agentic",
  rag_service = {
    host_runner = os.getenv("HOME") .. "/infra",
    runner = "docker",
    enabled = false,
    llm = {
      provider = "ollama",
      model = "kimi-k2:1t-cloud",
      endpoint = "http://localhost:11434",
      api_key = "OLLAMA_API_KEY",
      extra = nil,
    },
    embed = {
      provider = "ollama",
      model = "embeddinggemma:latest",
      endpoint = "http://localhost:11434",
      api_key = "OLLAMA_API_KEY",
      extra = nil,
    },
    docker_extra_args=""
  },
  providers = {
    openrouter = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "deepseek/deepseek-r1"
    },
    perplexity = {
      __inherited_from = "openai",
      endpoint = "https://api.perplexity.ai",
      api_key_name = "PERPLEXITY_API_KEY",
      model = "gemini-2.5-pro",
    },
    ollama = {
      endpoint = "http://localhost:11434",
      api_key_name = "OLLAMA_API_KEY",
      model = "qwen3-coder:480b-cloud",
    },
    locallama = {
      endpoint = "http://localhost:11434",
      api_key_name = "OLLAMA_API_KEY",
      model = "qwen3-coder:480b",
    },
    openai = {
      __inherited_from = "openai",
      endpoint = "https://api.openai.com/v1",
      api_key_name = "OPENAI_API_KEY",
      model = "gpt-5",
    }
  },
  acp_providers = {
    ["gemini-cli"] = {
      command = "gemini",
      args = { "--experimental-acp" },
      env = {
        NODE_NO_WARNINGS = "1",
        GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
      }
    },
    ["claude-code"] = {
      command = "npx",
      args = { "@zed-industries/claude-code-acp" },
      env = {
        NODE_NO_WARNINGS = "1",
        ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
      }
    }

  },
  system_prompt =  function()
    local h = require("mcphub").get_hub_instance()
    return h and h:get_active_servers_prompt() or ""
  end,
  custom_tools = function()
    return {
      require("mcphub.extensions.avante").mcp_tool()
    }
  end,
  instructions_file = "AGENTS.md",
  provider = "copilot"
}
