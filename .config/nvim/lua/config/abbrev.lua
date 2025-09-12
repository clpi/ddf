local A = {
  c = setmetatable({
    tl = "Telescope",
    tr = "Trouble",
    la = "Lazy",
    ma = "Mason",
    sm = "Supermaven",
    cpe = "Copilot enable",
    cpa = "Copilot auth",
    cpd = "Copilot disable",
    cpt = "Copilot toggle",
    cmt = "Codeium Toggle",
    smt = "Supermaven toggle",
    rf = "Refactor",
    cp = "Copilot",
    cm = "Codeium",
    il = "Illuminate",
    wk = "WhichKey",
    td = "Todo",
    ae = "Aerial",
    aen = "AerialNav",
    aet = "AerialToggle",
    nc = "Neoconf",
    ov = "Overseer",
    no = "Noice",
    noa = "NoiceAll",
    noe = "NoiceErrors",
    tt = "ToggleTerm",
    tsi = "TSInstall",
    tst = "TSToggle",
    tse = "TSEnable",
    lax = "LazyExtras",
    ins = "Inspect",
    tsd = "TSDisable",
    av = "Avante",
    ap = "AddProject",
    cc = "CopilotChat",
    co = "CodeCompanion",
    gf = "GrugFar",
    ovt = "OverseerToggle",
  }, {
    __call = function(self)
      for k, v in pairs(self) do
        if type(v) == "string" then
          vim.cmd(string.format("cabbrev %s %s", k, v))
        end
      end
    end,
  }),
  i = {},
}

A.c()

return A
