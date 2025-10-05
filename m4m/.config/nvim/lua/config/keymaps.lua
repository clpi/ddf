local u = require("config.util")
local km = vim.keymap.set
local d = vim.diagnostic
local k, m, v, c, n, ln, lln, llln, i = u.k, u.m, u.v, u.c, u.n, u.ln, u.lln, u.llln, u.i

km({ "n", "v" }, ";", ":", { silent = false })
km("n", "0", "^", { silent = true, nowait = true, noremap = true })
km({ "n" }, "U", "<C-r>", { desc = "Redo" })
km({ "n" }, "<ESC>", "<CMD>nohl<CR>", { silent = true, desc = "No HL" })
km({ "t" }, "<ESC>", "<C-\\><C-n>", { silent = true, desc = "Normal Mode" })

m({ "v", "n" }, "H", "<CMD>BufferPrevious<CR>", "Previous buffer")
m({ "v", "n" }, "L", "<CMD>BufferNext<CR>", "Next buffer")

-- command and insert mode navigation
m({ "c", "i" }, "<c-a>", "<home>")
m({ "c", "i" }, "<c-e>", "<end>")
m({ "c", "i" }, "<c-f>", "<right>")
m({ "c", "i" }, "<c-b>", "<left>")

-- window navigation
m({ "n", "i", "t", "v" }, "<c-j>", "<c-w>j")
m({ "n", "i", "t", "v" }, "<c-h>", "<c-w>h")
m({ "n", "i", "t", "v" }, "<c-k>", "<c-w>k")
m({ "n", "i", "t", "v" }, "<c-l>", "<c-w>l")
n("<tab>", function()
	d.jump({ count = 1, float = true })
end, "Next diagnostic")
n("<s-tab>", function()
	d.jump({ count = -1, float = true })
end, "Prev diagnostic")
v("<tab>", function()
	d.jump({ count = 1, float = true })
end, "Next diagnostic")
v("<s-tab>", function()
	d.jump({ count = -1, float = true })
end, "Prev diagnostic")

--#region <SPACE> keymaps

-- Utility
ln("\\", "AerialToggle", "Aerial")
ln("-", "split", "Horizontal split")
ln("_", "vsplit", "Vertical split")
ln("<bs>", "cd ..", "cd ..")
ln("<cr>", "cd %:p:h", "cd buffer directory")
ln(".", "so %", "Source buffer")
ln(":", "Telescope commands", "Commands")
ln("so", "so %", "Source current buf")
ln("/", "Telescope live_grep", "Live grep")
ln("?", "Telescope live_grep cwd=%:p:h", "Live grep in cwd")

-- [l]sp
ln("ld", d.open_float, "Line diagnostic")
ln("lD", d.show, "Show line diagnostic")

-- [f]ind
ln("fF", "Telescope live_grep cwd=%:p:h", "Live grep in cwd")
ln("f.", "Telescope find_files cwd=%:p:h", "Format File")
ln("ff", "Telescope find_files", "Find Files")
ln("fr", "Telescope oldfiles", "Recent Files")
ln("fc", "Telescope commands", "Commands")
ln("fh", "Telescope help_tags", "Help Tags")
ln("fm", "Telescope marks", "Marks")
ln("ft", "Telescope treesitter", "Treesitter")
ln("fs", "Telescope lsp_document_symbols", "Document Symbols")
ln("fS", "Telescope lsp_dynamic_workspace_symbols", "Workspace Symbols")
ln("fgb", "Telescope git_branches", "Git Branches")
ln("fgc", "Telescope git_commits", "Git Commits")
ln("fgs", "Telescope git_status", "Git Status")
ln("fo", "Telescope oldfiles", "Oldfiles")
ln("fp", "Telescope pickers", "Pickers")
ln("fd", "Telescope diagnostics", "Pickers")
ln("fB", "Telescope buffers", "Find Buffers")
ln("fz", "Telescope zoxide", "Zoxide")
ln("fA", "Telescope aerial", "Aerial")
ln("fb", "Telescope file_browser", "File browser")
ln("fa", "Telescope find_files follow=true no_ignore=true hidden=true", "Telescope find all files")

-- [c]ode
ln("cd", "Trouble diagnostics", "Trouble diagnostics")
ln("cl", "Trouble lsp", "Trouble lsp")
ln("co", "AerialToggle", "Aerial")

-- [<tab>]s
ln("<tab>n", "tabnew", "New tab")
ln("<tab>x", "tabclose", "Close tab")
ln("<tab>o", "tabonly", "Close other tabs")
ln("<tab>l", "tabnext", "Next tab")
ln("<tab>h", "tabprevious", "Previous tab")
ln("<tab>.", "tabnext", "Next tab")
ln("<tab>,", "tabprevious", "Previous tab")

-- [b]uffer
ln("bl", "BufferLast", "Last buffer")
ln("bf", "BufferFirst", "First buffer")
ln("bn", "BufferNext", "Next buffer")
ln("bp", "BufferPrevious", "Previous buffer")

-- <SPACE> utilities

-- [r]eplace
ln("rr", "<esc>:%s///g<left><left><left>", "replace")
ln("rW", "<esc>:%s/<C-R>=expand('<cWORD>')<CR>//g<left><left>", "replace")
ln("rw", "<esc>:%s/<C-R>=expand('<cword>')<CR>//g<left><left>", "replace")
ln("rx", "<esc>:%s/<C-R>=expand('<cexpr>')<CR>//g<left><left>", "replace")
ln("rR", "<esc>:%s///gi<left><left><left><left>", "replace")

-- [o]pen
ln("oZ", "e ~/.zshrc", "zshrc")
ln("oH", "e ~/.config/helix/config.toml", "helix")
ln("of", "e ~/.config/fish/config.fish", "fish")
ln("og", "e ~/.config/ghostty/config", "ghostty")
ln("ok", "e ~/.config/kitty/kitty.conf", "kitty.conf")
ln("oa", "e ~/.config/alacritty/alacritty.toml", "alacritty")
ln("oK", "e ~/.config/zsh/keys.sh", "keys")
ln("ob", "e ~/.bashrc", "bashrc")
ln("oh", "e ~/.hyper.js", "hyper")
ln("og", "e ~/.gitconfig", "git")
ln("ot", "e ~/.tmux.conf", "tmux")
ln("oZ", "e ~/.config/zellij/config.kdl", "zellij")
ln("om", "e ~/.config/mise/config.toml", "mise")
ln("os", "e ~/.ssh/config", "ssh")
ln("ow", "e ~/.config/wezterm/wezterm.lua", "wezterm")
-- [o]pen [v]im configs
ln("ovv", "e ~/.vimrc", "vim")
ln("ove", "e ~/.config/ec/init.lua", "ec")
ln("ovc", "e ~/.config/ce/init.lua", "ce")
ln("ovn", "e ~/.config/ne/init.lua", "ne")
ln("ovi", "e ~/.config/iv/init.lua", "iv")
-- [o]pen [z]sh configs
ln("ozz", "e ~/.zshrc", "zshrc")
ln("ozp", "e ~/.config/zsh/path.sh", "path")
ln("ozk", "e ~/.config/zsh/keys.sh", "keys")
ln("ozE", "e ~/.config/zsh/eval.sh", "eval")
ln("ozo", "e ~/.config/zsh/overrides.sh", "overrides")
ln("oze", "e ~/.config/zsh/export.sh", "export")
ln("oza", "e ~/.config/zsh/alias.sh", "alias")
ln("ozo", "e ~/.config/zsh/opts.sh", "opts")
ln("ozf", "e ~/.config/zsh/fn.sh", "fn")

-- [v]im
ln("vc", "e ~/.config/nvim/init.lua", "init.lua")
ln("vs", "e ~/.config/nvim/lua/setup.lua", "lua/setup.lua")
ln("vk", "e ~/.config/nvim/lua/config/keymaps.lua", "keymaps.lua")
ln("vo", "e ~/.config/nvim/lua/config/opts.lua", "opts.lua")
ln("vi", "e ~/.config/nvim/init.lua", "init.lua")
ln("vc", "e ~/.config/nvim/lua/config/cmd.lua", "cmd.lua")
ln("vF", "e ~/.config/nvim/lua/config/ft.lua", "ft.lua")
ln("va", "e ~/.config/nvim/lua/config/autocmd.lua", "autocmd.lua")
ln("va", "e ~/.config/nvim/lua/config/abbrev.lua", "abbrev.lua")
ln("vl", "e ~/.config/nvim/lua/config/lsp.lua", "lsp.lua")
ln("vv", "Telescope find_files cwd=~/.config/nvim", "find")
ln("vf", "Telescope find_files cwd=~/.config/iv", "find")
ln("vu", "e ~/.config/nvim/lua/config/util.lua", "util.lua")
ln("vg", "Telescope live_grep cwd=~/.config/iv", "grep")
ln("vP", "e ~/.config/nvim/lua/plugins/init.lua", "plugins.lua")
-- [v]im [p]lugins
ln("vpi", "e ~/.config/nvim/lua/plugins/init.lua", "plugins.lua")
ln("vpp", "e ~/.config/nvim/lua/plugins/pairs.lua", "pairs.lua")
ln("vps", "e ~/.config/nvim/lua/plugins/search.lua", "search.lua")
ln("vpB", "e ~/.config/nvim/lua/plugins/bufferline.lua", "bufferline.lua")
ln("vpS", "e ~/.config/nvim/lua/plugins/statusbar.lua", "statusbar.lua")
ln("vpb", "e ~/.config/nvim/lua/plugins/blink.lua", "blink.lua")
ln("vpd", "e ~/.config/nvim/lua/plugins/dap.lua", "dap.lua")
ln("vpD", "e ~/.config/nvim/lua/plugins/diagnostics.lua", "diagnostics.lua")
ln("vpc", "e ~/.config/nvim/lua/plugins/copilot.lua", "copilot.lua")
ln("vpC", "e ~/.config/nvim/lua/plugins/colors.lua", "colors.lua")
ln("vpg", "e ~/.config/nvim/lua/plugins/git.lua", "git.lua")
ln("vpu", "e ~/.config/nvim/lua/plugins/ui.lua", "ui.lua")
ln("vpl", "e ~/.config/nvim/lua/plugins/lsp.lua", "lsp.lua")
ln("vpa", "e ~/.config/nvim/lua/plugins/ai.lua", "ai.lua")
ln("vpq", "e ~/.config/nvim/lua/plugins/qol.lua", "qol.lua")
ln("vpM", "e ~/.config/nvim/lua/plugins/mason.lua", "mason.lua")
ln("vpf", "e ~/.config/nvim/lua/plugins/telescope.lua", "telescope.lua")
ln("vpm", "e ~/.config/nvim/lua/plugins/markdown.lua", "markdown.lua")
ln("vpT", "e ~/.config/nvim/lua/plugins/test.lua", "test.lua")
ln("vpo", "e ~/.config/nvim/lua/plugins/outline.lua", "outline.lua")
ln("vpt", "e ~/.config/nvim/lua/plugins/treesitter.lua", "treesitter.lua")
ln("vps", "e ~/.config/nvim/lua/plugins/term.lua", "term.lua")
ln("vpe", "e ~/.config/nvim/lua/plugins/tree.lua", "tree.lua")

-- [\] locallocalleader
llln("K", "<cmd>cnext<CR>zz", "Next quickfix")
llln("J", "<cmd>cprev<CR>zz", "Prev quickfix")
llln("k", "<cmd>lnext<CR>zz", "Next loclist")
llln("j", "<cmd>lprev<CR>zz", "Prev loclist")

m("t", "<c-p>", "<up>", { silent = true, nowait = true, noremap = true })
m("t", "<c-n>", "<down>", { silent = true, nowait = true, noremap = true })

m("n", "<Esc>", "<cmd>noh", "Clear highlights")
m({ "n", "x" }, "<localleader>F", function()
	require("conform").format({ lsp_fallback = true })
end, "Format file")

local cc = require("CopilotChat")
local ccs = require("CopilotChat.select")
local inp = vim.fn.input
n("<leader>cq", function()
	local i = inp("Quick Chat: ")
	if i ~= "" then
		cc.ask(i, {
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
local qui = require("quicker")
ln("qf", qui.toggle, "Toggle quickfix")
ln("ll", function()
	qui.toggle({ loclist = true })
end, "Toggle loclist")
