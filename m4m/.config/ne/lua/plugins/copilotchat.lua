local vc = require("vectorcode.integrations.copilotchat")
return {
  contexts = {
    vectorcode = vc.make_context_provider({
      prompt_header = "Here are the relevant files",
      prompt_footer = "\nConsider this context when answering:",
      skip_empty = true,
    })
  }
}
