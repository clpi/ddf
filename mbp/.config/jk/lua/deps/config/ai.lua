  require("copilot").setup({
    hints = { 
      enabled = true 
    },
    panel = {
      enabled = true,
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = '<tab>',
        next = '<C-]>',
        prev = '<C-]>'
      }
    },
    -- suggestion = {
    --   enabled = true,
    --   auto_trigger = true,
    -- },
  })

  require("sg").setup{


  }
  require("CopilotChat").setup({
    chat_autocomplete = true,
    allow_insecure = true,
    model = "gpt-4o"
  })

  require("codecompanion").setup({
    strategies = {
      chat = {
        adapter = "copilot"
      },
      inline = {
        adapter = "copilot"
      },
      agent = {
        adapter = "copilot"
      }
    }
  })
  -- require("avante").setup({
  --   provider = 'copilot',
  --
  --   behaviour = {
  --     auto_suggestions = true,
  --     auto_set_highlight_group = true,
  --     auto_set_keymaps = true,
  --     auto_apply_diff_after_generation = true,
  --     support_paste_from_clipboard = true,
  --   },
  --   hints={enabled=true},
  -- })
  --
