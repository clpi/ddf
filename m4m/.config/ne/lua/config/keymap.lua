local km = vim.keymap.set
local u = require("util")
local b = vim.lsp.buf
local d = vim.diagnostic
local o, k, m, v, c, n, ln, lln, llln, i, update = u.o, u.k, u.m, u.v, u.c, u.n, u.ln, u.lln, u.llln, u.i, u.update

km("n", ";", ":")
km({ "v", "n" }, "]", function()
	vim.diagnostic.jump({ count = 1 })
end, { silent = true, noremap = true, nowait = true, desc = "Next diagnostic" })
km({ "v", "n" }, "[", function()
	vim.diagnostic.jump({ count = -1 })
end, { silent = true, noremap = true, nowait = true, desc = "Prev diagnostic" })
km(
	{ "v", "n" },
	",d",
	vim.diagnostic.show,
	{ silent = true, noremap = true, nowait = true, desc = "Show line diagnostic" }
)
km("n", "H", "<CMD>BufferPrevious<CR>", { desc = "Previous buffer", silent = true, noremap = true, nowait = true })
km("n", "X", "<CMD>BufferDelete<CR>", { desc = "Delete buffer", silent = true, noremap = true, nowait = true })
km("n", "L", "<CMD>BufferNext<CR>", { desc = "Next buffer", silent = true, noremap = true, nowait = true })
km("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode
-- km("c", "<tab>", "<c-i>") -- Move to the beginning of the line


km({ "i", "c" }, "<C-a>", "<Home>") -- Move to the beginning of the line
km({ "i", "c" }, "<C-e>", "<End>") -- Move to the end of the line
km({ "i", "c" }, "<C-b>", "<Left>") -- Move one character to the left
km({ "i", "c" }, "<C-f>", "<Right>") -- Move one character

km({ "n", "v" }, "<C-j>", "<C-w>j") -- Move to the window below
km({ "n", "v" }, "<C-k>", "<C-w>k") -- Move
km({ "n", "v" }, "<C-h>", "<C-w>h") -- Move to the window on the left
km({ "n", "v" }, "<C-l>", "<C-w>l") -- Move
km({ "n", "v" }, "<space>-", "<C-w>s") -- Move
km({ "n", "v" }, "<space>_", "<C-w>v") -- Move
km({ "n", "v" }, "<space>=", "<C-w>v") -- Move

km({ "n", "v" }, ";", ":", { silent = false })
km("n", "0", "^", { silent = true, nowait = true, noremap = true })
km({ "n" }, "U", "<C-r>", { desc = "Redo" })
km({ "n" }, "<ESC>", "<CMD>nohl<CR>", { silent = true, desc = "No HL" })
km({ "t" }, "<ESC>", "<C-\\><C-n>", { silent = true, desc = "Normal Mode" })

m({ "v", "n" }, "H", "<CMD>BufferPrevious<CR>", "Previous buffer")
m({ "v", "n" }, "L", "<CMD>BufferNext<CR>", "Next buffer")


--#region [root] diagnostics
n(")", function()
	d.jump({ count = 1, float = true })
end, "Next diagnostic")
n("(", function()
	d.jump({ count = -1, float = true })
end, "Prev diagnostic")
v(")", function()
	d.jump({ count = 1, float = true })
end, "Next diagnostic")
v("(", function()
	d.jump({ count = -1, float = true })
end, "Prev diagnostic")
--#endregion

--#region [leader] keymaps

--#region [leader] [root] keymaps
ln("<space>", function() require("snacks").picker.smart()end, "Smart find")
ln("\\", "AerialToggle", "Aerial")
ln("/", function() require("snacks").picker.grep()end, "live grep")
ln("?", "lua Snacks.picker.grep({cwd=vim.fn.expand('%:p:h')})", "live grep in cwd")
ln("-", "split", "Horizontal split")
ln("_", "vsplit", "Vertical split")
ln("<bs>", "cd ..", "cd ..")
ln("<cr>", "cd %:p:h", "cd buffer directory")
ln(".", "so %", "Source buffer")
ln(":", "lua Snacks.picker.commands()", "Commands")
ln(";", "lua Snacks.picker.command_history()", "Commands")
ln("/", "lua Snacks.picker.grep()", "Live grep")
ln("?", "lua Snacks.picker.grep({ cwd=vim.fn.expand('%:p:h')})", "Live grep in cwd")
ln("'", "lua Snacks.picker.grep()", "Live grep")
ln("\"", "lua Snacks.picker.grep({ cwd=vim.fn.expand('%:p:h')})", "Live grep in cwd")
ln("|", "CopilotChat", "CopilotChat")
ln("=", "CodeCompanion", "CodeCompanion")
ln("+", "Neogit", "Neogit")
ln("`", "ClaudeCode", "ClaudeCode")
ln("F", b.format, "Format buffer") -- Format the current buffer using LSP
--#endregion

--#region [l]sp
ln("ld", d.open_float, "Line diagnostic")
ln("lD", d.show, "Show line diagnostic")
--#endregion

--#region [p]lugins
ln("pu", update, "Update plugins")
--#endregion

--#region [f]ind
ln("fi", function() require("snacks").picker.smart({cwd="~/infrastructure"})end, "find infrastructure")
ln("fI", function() require("snacks").picker.grep({cwd="~/infrastructure"})end, "find infrastructure")
ln("ff", "lua Snacks.picker.files()", "Files")
ln("fF", "lua Snacks.picker.files({cwd=vim.fn.expand('%:p:h')})", "Files in cwd")
ln("fg", "lua Snacks.picker.grep()", "Grep")
ln("fb", "lua Snacks.picker.buffers()", "Buffers")
ln("fr", "lua Snacks.picker.recent()", "Recent")
ln("fh", "lua Snacks.picker.help()", "Help")
ln("fF", "lua Snacks.picker.grep({cwd=vim.fn.expand('%:p:h')})", "Live grep in cwd")
ln("f.", "lua Snacks.picker.files({cwd=vim.fn.expand('%:p:h')})", "Files in cwd")
ln("ff", "lua Snacks.picker.files()", "Find Files")
ln("f;", "lua Snacks.picker.command_history()", "Command history")
ln("fc", "lua Snacks.picker.commands()", "Commands")
ln("fh", "lua Snacks.picker.help()", "Help Tags")
ln("fm", "lua Snacks.picker.marks()", "Marks")
ln("ft", "lua Snacks.picker.treesitter()", "Treesitter")
ln("fL", "lua Snacks.picker.lsp_config()", "LSP Config")
ln("fs", "lua Snacks.picker.lsp_symbols()", "Document Symbols")
ln("fS", "lua Snacks.picker.lsp_workspace_symbols()", "Workspace Symbols")
ln("fgb", "lua Snacks.picker.git_branches()", "Git Branches")
ln("fgc", "lua Snacks.picker.git_log()", "Git log")
ln("fgs", "lua Snacks.picker.git_status()", "Git Status")
ln("fo", "lua Snacks.picker.recent()", "recent")
ln("fp", "lua Snacks.picker.pickers", "Pickers")
ln("fd", "lua Snacks.picker.diagnostics()", "Pickers")
ln("fB", "lua Snacks.picker.buffers()", "Find Buffers")
ln("fz", "lua Snacks.picker.zoxide()", "Zoxide")
ln("fT", "lua Snacks.picker.todo_comments()", "todo_comments")
ln("fA", "lua Snacks.picker.autocmds()", "autocmds")
ln("fb", "lua Snacks.explorer()", "File browser")
ln("fa", "lua Snacks.picker.files()", "lua Snacks.picker.find all files")
--#endregion

--#region [c]ode
ln("cd", "Trouble diagnostics", "Trouble diagnostics")
ln("cl", "Trouble lsp", "Trouble lsp")
ln("co", "AerialToggle", "Aerial")
--#endregion

--#region [t]abs
ln("tn", "tabnew", "New tab")
ln("tx", "tabclose", "Close tab")
ln("to", "tabonly", "Close other tabs")
ln("tl", "tabnext", "Next tab")
ln("th", "tabprevious", "Previous tab")
ln("t.", "tabnext", "Next tab")
ln("t,", "tabprevious", "Previous tab")
--#endregion

--#region [<tab>]s
ln("<tab>n", "tabnew", "New tab")
ln("<tab>x", "tabclose", "Close tab")
ln("<tab>o", "tabonly", "Close other tabs")
ln("<tab>l", "tabnext", "Next tab")
ln("<tab>h", "tabprevious", "Previous tab")
ln("<tab>.", "tabnext", "Next tab")
ln("<tab>,", "tabprevious", "Previous tab")
--#endregion

--#region [b]uffer
ln("bl", "BufferLast", "Last buffer")
ln("bf", "BufferFirst", "First buffer")
ln("bn", "BufferNext", "Next buffer")
ln("bp", "BufferPin", "Pin buffer")
ln("bd", "BufferDelete", "Buffer delete")
ln("bc", "BufferDelete", "Buffer close")
ln("bv", "BufferCloseAllButVisible", "Close all but visible")
ln("bP", "BufferCloseAllButPinned", "Close all but pinned")
ln("bp", "BufferPrevious", "Previous buffer")
ln("bb", "BufferPick", "Pick buffer")
ln("br", "BufferRestore", "Restore buffer")
ln("b.", "BufferNext", "Next buffer")
ln("b,", "BufferPrevious", "Previous buffer")
ln("b>", "BufferMoveNext", "Move buffer right")
ln("b<", "BufferMovePrevious", "Move buffer left")
ln("bD", "BufferPickDelete", "Pick buffer to delete")
--#endregion

--#region [r]eplace
ln("rr", "%s///g<left><left><left>", "replace")
ln("rW", "%s/<C-R>=expand('<cWORD>')<CR>//g<left><left>", "replace WORD")
ln("rw", "%s/<C-R>=expand('<cword>')<CR>//g<left><left>", "replace word")
ln("rf", "%s/<C-R>=expand('<cfile>')<CR>//g<left><left>", "replace file")
ln("rc", "%s/<C-R>=expand('<character>')<CR>//g<left><left>", "[r]eplace [c]har")
ln("rx", "%s/<C-R>=expand('<cexpr>')<CR>//g<left><left>", "replace expr")
ln("re", "%s/<C-R>=expand('<cexpr>')<CR>//g<left><left>", "[r]eplace [e]xpr")
ln("rR", "%s///gi<left><left><left><left>", "[r]eplace [i]nsensitive")
--#endregion

--#region [o]pen
o("oC", "~/.cloudflared/config.yml", "Cloudflared config.yml")
o("oZ", "~/.zshrc", "zshrc")
ln("of", function() require("snacks").picker.smart({cwd="~/.config"})end, "find dotfiles")
ln("o/", function() require("snacks").picker.grep({cwd="~/.config"})end, "grep dotfiles")
ln("oI", function() require("snacks").picker.smart({cwd="~/infrastructure"})end, "find infrastructure")
ln("oH", function() require("snacks").picker.smart({cwd="~/hg"})end, "find hashgraph")
o("oj", "~/.config/zellij/config.kdl", "zellij")
o("om", "~/.config/mise/config.toml", "mise")
o("oa", "~/.config/atuin/config.toml", "atuin")
o("oH", "~/.config/helix/config.toml", "helix")
o("oF", "~/.config/fish/config.fish", "fish")
o("og", "~/.config/ghostty/config", "ghostty")
o("ok", "~/.config/kitty/kitty.conf", "kitty.conf")
o("oa", "~/.config/alacritty/alacritty.toml", "alacritty")
o("oK", "~/.config/zsh/keys.sh", "keys")
o("ob", "~/.bashrc", "bashrc")
o("oh", "~/.hyper.js", "hyper")
o("og", "~/.gitconfig", "git")
o("ot", "~/.tmux.conf", "tmux")
o("oZ", "~/.config/zellij/config.kdl", "zellij")
o("om", "~/.config/mise/config.toml", "mise")
o("os", "~/.ssh/config", "ssh")
o("ow", "~/.config/wezterm/wezterm.lua", "wezterm")
o("ot", "~/.tmux.conf", "tmux")

--#region [o]pen [v]im configs
o("ovv", "~/.vimrc", "vim")
o("ove", "~/.config/ec/init.lua", "ec")
o("ovc", "~/.config/ce/init.lua", "ce")
o("ovn", "~/.config/ne/init.lua", "ne")
o("ovi", "~/.config/iv/init.lua", "iv")
--#endregion

--#region [o]pen [z]sh configs
o("ozz", "~/.zshrc", "zshrc")
o("ozp", "~/.config/zsh/path.sh", "path")
o("ozk", "~/.config/zsh/keys.sh", "keys")
o("ozE", "~/.config/zsh/eval.sh", "eval")
o("ozo", "~/.config/zsh/overrides.sh", "overrides")
o("oze", "~/.config/zsh/export.sh", "export")
o("oza", "~/.config/zsh/alias.sh", "alias")
o("ozo", "~/.config/zsh/opts.sh", "opts")
o("ozf", "~/.config/zsh/fn.sh", "fn")
o("oZ", "~/.config/zsh/zshenv", "zshenv")
--#endregion

o("oF", "~/.config/fish/config.fish", "fish config")
--#region [o]pen [f]ish configs
o("off", "~/.config/fish/config.fish", "fish config")
o("ofa", "~/.config/fish/alias.fish", "fish aliases")
o("ofe", "~/.config/fish/export.fish", "fish exports")
o("ofv", "~/.config/fish/vars.fish", "fish vars")
o("ofs", "~/.config/fish/source.fish", "fish source")
o("ofk", "~/.config/fish/keys.fish", "fish keys")
o("ofp", "~/.config/fish/alias.fish", "fish path")
o("ofm", "~/.config/fish/maps.fish", "fish maps")
--#endregion
--#endregion

--#region [v]im
o("vrc", "~/.config/ne/lua/config/init.lua")
o("vp", "~/.config/ne/lua/plugins.lua", "Open plugins.lua")
o("vk", "~/.config/ne/lua/config/keymap.lua")
o("vc", "~/.config/ne/lua/config/init.lua")
o("vo", "~/.config/ne/lua/config/opts.lua")
o("vl", "~/.config/ne/lua/lsp/init.lua")
o("vi", "~/.config/ne/init.lua")
o("vc", "~/.config/ne/init.lua", "init.lua")
o("vs", "~/.config/ne/lua/setup.lua", "lua/setup.lua")
o("vk", "~/.config/ne/lua/config/keymap.lua", "keymap.lua")
o("vo", "~/.config/ne/lua/config/opts.lua", "opts.lua")
o("vi", "~/.config/ne/init.lua", "init.lua")
o("vc", "~/.config/ne/lua/config/cmd.lua", "cmd.lua")
o("vF", "~/.config/ne/lua/config/ft.lua", "ft.lua")
o("va", "~/.config/ne/lua/config/autocmd.lua", "autocmd.lua")
o("va", "~/.config/ne/lua/config/abbrev.lua", "abbrev.lua")
o("vl", "~/.config/ne/lua/lsp.lua", "lsp.lua")
ln("vv", "lua Snacks.picker.files({cwd='~/.config/ne'})", "find")
ln("vf", "lua Snacks.picker.files({cwd='~/.config/ne'})", "find")
o("vu", "~/.config/ne/lua/util.lua", "util.lua")
ln("vg", "lua Snacks.picker.grep({ cwd='~/.config/iv' })", "grep")
o("vP", "~/.config/ne/lua/plugins/spec.lua", "spec.lua")
--#region [v]im [p]lugins
o("vpA", "~/.config/ne/lua/plugins/sidekick.lua", "Open sidekick.lua")
o("vpp", "~/.config/ne/lua/plugins.lua", "Open plugins.lua")
o("vpb", "~/.config/ne/lua/plugins/blink.lua", "Open blink.lua")
o("vpc", "~/.config/ne/lua/plugins/codecompanion.lua", "Open codecompanion.lua")
o("vpC", "~/.config/ne/lua/plugins/colorful-menu.lua", "Open codecompanion.lua")
o("vpl", "~/.config/ne/lua/plugins/lualine.lua", "Open lualine.lua")
o("vpd", "~/.config/ne/lua/plugins/down.lua", "Open down.lua")
o("vpm", "~/.config/ne/lua/plugins/mason.lua", "Open mason.lua")
o("vpt", "~/.config/ne/lua/plugins/treesitter.lua", "Open treesitter.lua")
o("vpT", "~/.config/ne/lua/plugins/telescope.lua", "Open telescope.lua")
o("vpn", "~/.config/ne/lua/plugins/navic.lua", "Open navic.lua")
o("vps", "~/.config/ne/lua/plugins/spec.lua", "Open spec.lua")
o("vpS", "~/.config/ne/lua/plugins/snacks.lua", "Open snacks.lua")
o("vpe", "~/.config/ne/lua/plugins/edgy.lua", "Open edgy.lua")
--#endregion
--#endregion
--
local s = require("snacks")
local sk = require("sidekick")
local p = require("persistence")
local sp = s.picker

--#region [leader] [s]essions, sidekick, source
ln("so", "so %", "Source current buf")
ln("st", function() sk.toggle() end, "Sidekick toggle CLI")
ln("ss", function() sk.select() end, "Sidekick select CLI")
ln("sp", function() sk.prompt() end, "Sidekick prompt CLI")
ln("sf", function() sk.focus() end, "Sidekick prompt CLI")
ln("sc", function() sk.toggle({ name = "claude", focus = true}) end, "Sidekick toggle Claude")
ln("ss", function() p.load() end, "Restore session")
ln("sS", function() p.select() end, "Select session")
ln("sl", function() p.load({ last = true }) end, "Load last session")
ln("sd", function() p.stop() end, "Stop persistence")
--#endregion
--#endregion
--#region [localleader] [root] keymaps
lln("<cr>", function()sp.resume()end, "Snacks resume")
lln("<tab>", function()sp.resume()end, "Resume")
lln("<s-tab>", function()sp.grep_buffers()end, "Grep buffers")
lln("R", function()s.rename.rename_file()end, "Snacks rename file")
lln("T", function()s.terminal.toggle()end, "Terminal toggle")
lln("e", function()
	s.explorer()
end, "Snacks explorer")
lln("P", function()
	sp()
end, "Snacks picker")
lln("<space>", function()
	sp.smart()
end, "Snacks picker smart")
lln(".", function()
	sp.git_files()
end, "Snacksp.git_files")
lln("B", function()
	sp.grep_buffers()
end, "Snacks grep buffers")
lln("D", function()
	s.bufdelete()
end, "Snacks grep buffers")
lln("/", function()
	sp.grep()
end, "Snacks grep")
lln("?", function()
	sp.search_history()
end, "Snacks search history")
lln(":", function()
	sp.command_history()
end, "Snacks command history")
lln(";", function()
	sp.commands()
end, "Snacks command history")
lln(",", function()
	sp.buffers()
end, "Snacks buffers")
lln("m", function()
	sp.commands()
end, "Snacks commands")
lln("M", function()
	sp.command_history()
end, "Snacks commands")
lln("z", function()
	s.zen()
end, "Snacks zen")
lln("Z", function()
	s.zen.zoom()
end, "Snacks zen zoom")

--#region [localleader] [l]sp
lln("lf", function()
	sp.lsp_definitions()
end, "Snacks lsp definitions")
lln("ll", function()
	sp.lsp_declarations()
end, "Snacks lsp declarations")
lln("li", function()
	sp.lsp_implementations()
end, "Snacks lsp implementations")
lln("lr", function()
	sp.lsp_references()
end, "Snacks lsp references")
lln("ls", function()
	sp.lsp_symbols()
end, "Snacks lsp symbols")
lln("lS", function()
	sp.lsp_workspace_symbols()
end, "Snacks lsp workspace symbols")
lln("ly", function()
	sp.lsp_type_definitions()
end, "Snacks lsp type definitions")
--#endregion

--#region [localleader] [f]ind
lln("ff", "lua Snacks.picker.files()", "Snacks files")
lln("fp", "lua Snacks.picker.projects()", "Snacks projects")
lln("fF", 'lua Snacks.picker.files({cwd=vim.fn.stdpath("config")})', "Snacks files in cwd")
lln("fh", function()
	sp.help()
end, "Snacks help")
lln("fs", "lua Snacks.picker.smart()", "Snacks find smart")
lln("fy", "lua Snacks.picker.cliphist()", "Snacks clipboard")
lln("fn", "lua Snacks.picker.notifications()", "Snacks find smart")
lln("fr", "lua Snacks.picker.recent()", "Snacks buffers")
lln("fl", "lua Snacks.picker.lines()", "Snacks lines")
lln("fd", function()
	sp.diagnostics()
end, "Snacks diagnostics")
lln("fD", function()
	sp.diagnostics_buffer()
end, "Snacks diagnostics buffer")
lln("fg", "lua Snacks.picker.grep()", "Snacks grep")
lln("fgw", "lua Snacks.picker.grep_word()", "Snacks grep word")
lln("fgb", "lua Snacks.picker.grep_buffers()", "Snacks grep word")
--#endregion
--
--#region [localleader] [f]ind
lln("gg", "lua Snacks.picker.git_grep()", "Snacks git grep")
lln("gb", "lua Snacks.picker.git_branches()", "Snacks git branches")
lln("gf", "lua Snacks.picker.git_files()", "Snacks git files")
lln("gs", "lua Snacks.picker.git_status()", "Snacks git status")
lln("gL", "lua Snacks.picker.git_log()", "Snacks git log file")
lln("gu", function()
	s.lazygit()
end, "Snacks lazygit")
lln("gB", function()
	s.gitbrowse()
end, "Snacks lazygit")
lln("glf", "lua Snacks.picker.git_log_file()", "Snacks git log file")
lln("gll", "lua Snacks.picker.git_log_line()", "Snacks git log line")
lln("gS", "lua Snacks.picker.git_stash()", "Snacks git stash")
lln("gd", "lua Snacks.picker.git_diff()", "Snacks git diff")
--#endregion

--#region [localleader] [s]cratch
lln("so", "lua Snacks.scratch()", "Snacks scratch open")
lln("ss", "lua Snacks.scratch()", "Snacks scratch select")
--#endregion

--#region [locallocalleader] keymaps
m("n", "\\K", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
m("n", "\\J", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
m("n", "\\k", "<cmd>lnext<CR>zz", { desc = "Next loclist" })
m("n", "\\j", "<cmd>lprev<CR>zz", { desc = "Prev loclist" })
--#endgion

m("t", "<c-p>", "<up>", { silent = true, nowait = true, noremap = true })
m("t", "<c-n>", "<down>", { silent = true, nowait = true, noremap = true })

m({ "n", "x" }, "<localleader>F", function()
	require("conform").format({ lsp_fallback = true })
end, "Format file")

local cc = require("CopilotChat")
local ccs = require("CopilotChat.select")
local inp = vim.fn.input
n("<leader>cq", function()
	local input = inp("Quick Chat: ")
	if input ~= "" then
		cc.ask(input, {
			selection = ccs.buffer,
		})
	end
end, "CopilotChat - Quick chat")
m({ "n", "v" }, "<leader>cP", function()
	local i = inp("Perplexity: ")
	if i ~= "" then
		cc.ask(i, {
			agent = "perplexityai",
			selection = false,
		})
	end
end, "CopilotChat - Perplexity Search")
m("n", "<C-s>", "<cmd>w", "general save file")
m("n", "<C-c>", "<cmd>%y+", "general copy whole file")
lln("a", "AerialToggle!", "Aerial")
i("<C-j>", "<Down>", "Move down")
i("<C-k>", "<Up>", "Move up")

vim.keymap.set("n", "<space>e", "<cmd>lua Snacks.explorer()<CR>", { desc="Explorer", silent = true, noremap = true, nowait = true })
-- local qui = require("quicker")
-- ln("qf", qui.toggle, "Toggle quickfix")
-- ln("ll", function()
-- 	qui.toggle({ loclist = true })
-- end, "Toggle loclist")

--#region [<C-*>] snacks
km({ "n", "t" }, "<C-o>", function()
	s.terminal()
end, { desc = "Terminal", silent = true, noremap = true, nowait = true })
km({ "n", "t" }, "<C-_>", function()
	s.terminal()
end, { desc = "Terminal", silent = true, noremap = true, nowait = true })
km({ "n", "t" }, "<C-/>", function()
	s.terminal()
end, { desc = "Terminal", silent = true, noremap = true, nowait = true })
km({ "n", "t" }, "<C-\\>", function()
	s.terminal()
end, { desc = "Terminal", silent = true, noremap = true, nowait = true })
km({ "n", "t" }, "<C-e>", function()
	s.explorer()
end, { desc = "Explorer", silent = true, noremap = true, nowait = true })
km({ "n"}, "<C-g>", function()
	s.gitbrowse()
end, { desc = "Lazygit", silent = true, noremap = true, nowait = true })
km({ "n"}, "<C-g>", function()
	s.lazygit()
end, { desc = "Gitbrowse", silent = true, noremap = true, nowait = true })
km({ "n"}, "<C-z>", function()
	s.zen()
end, { desc = "Scratch", silent = true, noremap = true, nowait = true })
km({ "n"}, "<C-s>", function()
	s.scratch()
end, { desc = "Lazygit", silent = true, noremap = true, nowait = true })
km({ "n" }, "<C-p>", function()
	s.picker.smart()
end, { desc = "Picker", silent = true, noremap = true, nowait = true })
km({ "n" }, "<C-S-p>", function()
	s.picker.commands()
end, { desc = "Picker", silent = true, noremap = true, nowait = true })
km({ "n" }, "<C-f>", function()
	s.picker.files()
end, { desc = "Picker", silent = true, noremap = true, nowait = true })
km({ "n" }, "<C-CR>", function()
	s.picker.grep()
end, { desc = "Grep", silent = true, noremap = true, nowait = true })
km({ "n" }, "<C-S-CR>", function()
	s.picker.grep_word()
end, { desc = "Grep word", silent = true, noremap = true, nowait = true })
km({ "n" }, "<S-CR>", function()
	s.picker.grep_buffers()
end, { desc = "Grep buffers", silent = true, noremap = true, nowait = true })
m({ "c", "i", "t" }, "<c-a>", "<home>")
m({ "c", "i", "t" }, "<c-e>", "<end>")
m({ "c", "i", "t" }, "<c-f>", "<right>")
m({ "c", "i", "t" }, "<c-b>", "<left>")
m({ "c", "t" }, "<C-p>", "<Up>") -- Move to the beginning of the line
m({ "c", "t" }, "<C-n>", "<down>") -- Move to the beginning of the line
--#endregion

--#region [root] window navigation
m({ "n", "i", "t", "v" }, "<c-j>", "<c-w>j")
m({ "n", "i", "t", "v" }, "<c-h>", "<c-w>h")
m({ "n", "i", "t", "v" }, "<c-k>", "<c-w>k")
m({ "n", "i", "t", "v" }, "<c-l>", "<c-w>l")
--#endregion
--#endregion


--#region [g]oto
km({"n"}, "gd", function() sp.lsp_definitions() end, { desc = "Go to definition", silent = true, noremap = true, nowait = true })
km({"n"}, "gD", function() sp.lsp_declarations() end, {
  desc = "Go to declaration", silent = true, noremap = true, nowait = true })
km({"n"}, "gi", function() sp.lsp_implementations() end, { desc = "Go to implementation", silent = true, noremap = true, nowait = true })
km({"n"}, "gr", function() sp.lsp_references() end, { desc = "Go to references", silent = true, noremap = true, nowait = true })
km({"n"}, "gy", function() sp.lsp_type_definitions() end, { desc = "Go to type definition", silent = true, noremap = true, nowait = true })
--#endregion
km({"n", "v"},
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
  {
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    })
