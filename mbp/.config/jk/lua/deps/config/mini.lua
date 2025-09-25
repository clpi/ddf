require("mini.pairs").setup({
	-- In which modes mappings from this `config` should be created
	modes = { insert = true, command = false, terminal = false },

	-- Global mappings. Each right hand side should be a pair information, a
	-- table with at least these fields (see more in |MiniPairs.map|):
	-- - <action> - one of "open", "close", "closeopen".
	-- - <pair> - two character string for pair to be used.
	-- By default pair is not inserted after `\`, quotes are not recognized by
	-- `<CR>`, `'` does not insert pair after a letter.
	-- Only parts of tables can be tweaked (others will use these defaults).
	-- Supply `false` instead of table to not map particular key.
	mappings = {
		["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
		["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
		["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

		[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
		["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
		["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

		['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
		["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
		["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
	},
})

require("mini.basics").setup({
	mappings = {
		basic = true,
		windows = true,
		move_with_alt = false,
	},
	autocommands = { basic = true },
	options = {
		extra_ui = true,
		basic = true,
		win_borders = "single",
	},
})

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.

-- Safely execute immediately
-- now(function()
local st = require("mini.starter")
-- end)
require("mini.starter").setup({
	evaluate_single = true,
	silent = false,
	autoopen = true,
	hooks = {
		st.gen_hook.adding_bullet(),
		st.gen_hook.indexing("all", { "Builtin actions" }),
		st.gen_hook.padding(3, 2),
		st.gen_hook.aligning("center", "center"),
	},
	header = [[
    [clpi mini.nvim]
  ]],
	query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
	footer = [[
    [clpi]
  ]],
	items = {
		st.sections.recent_files(10, true),
		st.sections.pick(),
		st.sections.builtin_actions(),
		st.sections.recent_files(10, false),
		st.sections.sessions(5, true),
		st.sections.telescope(),
	},
})
require("mini.notify").setup({
	window = {
		winblend = 25,
		max_window_share = 0.4,
	},
})
vim.notify = require("mini.notify").make_notify()
require("mini.icons").setup()
require("mini.cursorword").setup()
require("mini.tabline").setup({
	show_icons = true,
	show_help = true,
	set_vim_settings = true,
	format = function(bid, lbl)
		local suf = vim.bo[bid].modified and "+ " or ""
		return require("mini.tabline").default_format(bid, lbl) .. suf
	end,
	tabpage_section = "left",
})
local sl = require("mini.statusline")
local function inactive()
	local mode, mode_hl = sl.section_mode({ trunc_width = 120 })
	local git = sl.section_git({ trunc_width = 40 })
	local diff = sl.section_diff({ trunc_width = 75 })
	local diagnostics =
		sl.section_diagnostics({ signs = { ERROR = "!", WARN = "?", INFO = "@", HINT = "*" }, trunc_width = 75 })
	local lsp = sl.section_lsp({ trunc_width = 75 })
	local filename = sl.section_filename({ trunc_width = 140 })
	local fileinfo = sl.section_fileinfo({ trunc_width = 120 })
	local location = sl.section_location({ trunc_width = 75 })
	local search = sl.section_searchcount({ options = { recompute = true }, trunc_width = 75 })

	return sl.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
		"%<", -- Mark general truncate point
		{ hl = "MiniStatuslineFilename", strings = { filename } },
		"%=", -- End left alignment
		{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
		{ hl = mode_hl, strings = { search, location } },
	})
end
local function active()
	local mode, mode_hl = sl.section_mode({ trunc_width = 120 })
	local git = sl.section_git({ trunc_width = 40 })
	local diff = sl.section_diff({ trunc_width = 75 })
	local diagnostics =
		sl.section_diagnostics({ signs = { ERROR = "!", WARN = "?", INFO = "@", HINT = "*" }, trunc_width = 75 })
	local lsp = sl.section_lsp({ trunc_width = 75 })
	local filename = sl.section_filename({ trunc_width = 140 })
	local fileinfo = sl.section_fileinfo({ trunc_width = 120 })
	local location = sl.section_location({ trunc_width = 75 })
	local search = sl.section_searchcount({ options = { recompute = true }, trunc_width = 75 })

	return sl.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		{ hl = "MiniStatuslineDevinfo", strings = { filename } },
		"%<", -- Mark general truncate point
		{ hl = "MiniStatuslineFilename", strings = { fileinfo } },
		"%=", -- End left alignment
		{ hl = "MiniStatuslineFileinfo", strings = { diagnostics } },
		{ hl = mode_hl, strings = { lsp } },
	})
end
vim.cmd([[
cno <c-b> <left>
cno <c-f> <right>
cno <c-a> <home>
cno <c-e> <end>
cno <c-h> <bs>
]])
require("mini.statusline").setup({
	content = {
		active = active,
		inactive = inactive,
	},
	use_icons = true,
	set_vim_settings = true,
})
require("mini.bufremove").setup{
  set_vim_settings = true,
  silent = false,
}
require('mini.move').setup()
require("mini.extra").setup()
require("mini.misc").setup()
require("mini.sessions").setup({
	autowrite = true,
})
require("mini.git").setup()
require("mini.splitjoin").setup()
require("mini.colors").setup()
require("mini.files").setup({
	mappings = {
		close = "q",
		go_in = "<cr>",
		go_in_plus = "L",
		go_out = "-",
		go_out_plus = "H",
		mark_goto = "'",
		mark_set = "+",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "s",
		trim_left = "<",
		trim_right = ">",
	},
	options = {
		permanent_delete = true,
		use_as_default_explorer = true,
	},
	windows = {
		max_number = math.huge,
		preview = true,
		width_focus = 50,
		width_nofocus = 15,
		width_preview = 25,
	},
	content = {
		prefix = function(e)
			if e.fs_type == "directory" then
				return " ", "Directory"
			else
				return require("mini.files").default_prefix(e)
			end
		end,
	},
})
require("mini.map").setup({
	symbols = {
		encode = require("mini.map").gen_encode_symbols.dot(),
		scroll_line = "█",
		scroll_view = "┃",
	},
	window = {
		show_integration_count = true,
		winblend = 20,
		width = 10,
		side = "right",
		focusable = false,
	},
	integrations = {
		require("mini.map").gen_integration.diff(),
		require("mini.map").gen_integration.builtin_search(),
		require("mini.map").gen_integration.gitsigns(),
		require("mini.map").gen_integration.diagnostic({
			error = "DiagnosticFloatingError",
			warn = "DiagnosticFloatingWarn",
			info = "DiagnosticFloatingInfo",
			hint = "DiagnosticFloatingHint",
		}),
	},
})
require("mini.fuzzy").setup({
	cutoff = 100,
	defaults = {
		generic_sorter = require("mini.fuzzy").get_telescope_sorter,
	},
})
require("mini.hipatterns").setup({
	highlighters = {},
	delay = { text_change = 200, scroll = 50 },
})

require("mini.ai").setup()
require("mini.hues").setup({
	foreground = "#002734",
	background = "#c0c8cc",
	n_hues = 8,
	accent = "bg",
	plugins = {
		default = true,
	},
	saturation = "medium",
})
require("mini.comment").setup()
require('mini.animate').setup()
require("mini.pick").setup({
	options = {
		use_icons = true,
		use_cache = true,
	},
	mappings = {
		toggle_preview = "<c-o>",
		move_down = "<c-n>",
		move_up = "<c-p>",
		toggle_info = "<c-h>",
	},
})
vim.ui.select = require("mini.pick").ui_select
require("mini.surround").setup({})
require("mini.snippets").setup()
require("mini.test").setup()
require("mini.doc").setup()
local clue = require("mini.clue")
require("mini.clue").setup({
	clues = {
		clue.gen_clues.builtin_completion(),
		clue.gen_clues.z(),
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.windows(),
	},
})
require("mini.trailspace").setup()
require("mini.indentscope").setup({
	draw = {
		animation = function()
			return 1
		end,
	},
	symbol = "│",
})
require("mini.operators").setup()
-- require('mini.bracketed').setup()
require("mini.align").setup()
require("mini.visits").setup()
require("mini.pairs").setup()
require("mini.base16").setup({
	palette = require("mini.base16").mini_palette("#112641", "#e2e98f", 75),
	-- palette = {
	--     base00 = '#112641',
	--     base01 = '#3a475e',
	--     base02 = '#606b81',
	--     base03 = '#8691a7',
	--     base04 = '#d5dc81',
	--     base05 = '#e2e98f',
	--     base06 = '#eff69c',
	--     base07 = '#fcffaa',
	--     base08 = '#ffcfa0',
	--     base09 = '#cc7e46',
	--     base0A = '#46a436',
	--     base0B = '#9ff895',
	--     base0C = '#ca6ecf',
	--     base0D = '#42f7ff',
	--     base0E = '#ffc4ff',
	--     base0F = '#00a5c5',
	-- },
	use_cterm = true,
	plugins = {
		default = true,
		["echasnovski/mini.nvim"] = true,
	},
})
require("mini.completion").setup({
	delay = {
		completion = 0,
		info = 0,
		signature = 0,
	},
	window = {
		info = { height = 50, width = 80, border = "none" },
		signature = { height = 50, width = 80, border = "none" },
	},
	lsp_completion = {
		source_func = "completefunc",
		auto_setup = true,
		-- process_items = function(items, base)
		--   local res = vim.tbl_filter(function(item)
		--     -- Keep items which match the base and are not snippets
		--     local text = item.filterText or require("mini.completion").get_completion_word(item)
		--     return vim.startswith(text, base) and item.kind ~= 15
		--   end, items)
		--   res = vim.deepcopy(res)
		--   table.sort(res, function(a, b) return (a.sortText or a.label) < (b.sortText or b.label) end)
		--   -- Possibly add "kind" highlighting
		--   if _G.MiniIcons ~= nil then
		--     local add_kind_hlgroup = H.make_add_kind_hlgroup()
		--     for _, item in ipairs(res) do
		--       add_kind_hlgroup(item)
		--     end
		--   end
		--
		--   return res
		-- end,
		-- process_items = function()
		-- end,
	},
	-- fallback_action = function()
	--   local next = vim.api.nvim_replace_termcodes('<C-g><C-g><C-n>', true, false, true)
	--   vim.api.nvim_feedkeys(next, 'n', false)
	--   if require("copilot.suggestion").is_visible() then
	--     require("copilot.suggestion").select_next()
	--   elseif require("codeium.virtual_text").get_completion_text() ~= nil then
	--     require("codeium.virtual_text").set_style()
	--   else
	--   end
	-- end,
	mappings = {
		force_twostep = "<C-Space>", -- Force two-step completion
		force_fallback = "<C-e>", -- Force fallback completion
	},
	set_vim_settings = true,
})

require("mini.misc").setup_auto_root()
require("mini.misc").setup_restore_cursor()
require("mini.misc").setup_termbg_sync()
require("mini.icons").mock_nvim_web_devicons()
require("mini.icons").tweak_lsp_kind("replace")
require("mini.map").toggle()
vim.o.icm = 'split'
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

vim.o.showmode = false

-- Use rg
vim.o.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }
vim.opt.autochdir = true
