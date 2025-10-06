---@type sidekick.Config
return {
  copilot = {
    status = {
      enabled = true,
    }
  },
  prompts = {
      changes         = "Can you review my changes?",
      diagnostics     = "Can you help me fix the diagnostics in {file}?\n{diagnostics}",
      diagnostics_all = "Can you help me fix these diagnostics?\n{diagnostics_all}",
      document        = "Add documentation to {position}",
      explain         = "Explain {this}",
      fix             = "Can you fix {this}?",
      optimize        = "How can {this} be optimized?",
      review          = "Can you review {file} for any issues or improvements?",
      tests           = "Can you write tests for {this}?",
      -- simple context prompts
      buffers         = "{buffers}",
      file            = "{file}",
      position        = "{position}",
      selection       = "{selection}",
      ["function"]    = "{function}",
      class           = "{class}",
  },
  tools = {
    grok = {
      cmd = {
        "grok",
      }
    },
    copilot = {
      cmd = {
        "copilot",
        "--banner",
      }
    },
    cursor = {
      cmd = {
        "cursor-agent"
      }
    },
    amazon_q = {
      cmd = {
        "q"
      }
    },
    crush = {
      cmd = {
        "crush"
      }
    },
    aider = {
      cmd = {
        "aider",
      }
    },
    qwen = {
      cmd = {
        "qwen",
      }
    },
    gemini = {
      cmd = {
        "gemini"
      }
    },
    opencode = {
      cmd = {
        "opencode",
      }
    },
    codex = {
      cmd = {
        "codex",
        "--search",
      }
    },
    claude = {
      cmd = {
        "claude"
      }
    },

  },
  mux = {
    backend = "zellij",
    enabled = true
  }

}
