require("telescope").load_extension('harpoon')
require('telescope').load_extension('command_palette')
require("telescope").load_extension("git_worktree")

--LVIM SETUP
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "molokai"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.softtabstop = -1
lvim.leader = "space"
lvim.transparent_window = false
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.theme = "horizon"
vim.opt.cmdheight = 1

-- KEY BINDINGS
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'

--HARPOON
lvim.keys.normal_mode["<C-j>"] = ':lua require("harpoon.ui").nav_file(1)<CR>'
lvim.keys.normal_mode["<C-k>"] = ':lua require("harpoon.ui").nav_file(2)<CR>'
lvim.keys.normal_mode["<C-l>"] = ':lua require("harpoon.ui").nav_file(3)<CR>'
lvim.keys.normal_mode["<C-;>"] = ':lua require("harpoon.ui").nav_file(4)<CR>'
lvim.keys.normal_mode["<C-e>"] = ':lua require("harpoon.ui").toggle_quick_menu()<CR>'
lvim.keys.normal_mode["<C-m>"] = ':lua require("harpoon.mark").add_file()<CR>'
lvim.keys.normal_mode["<leader><c-r>"] = ':lua require("harpoon.mark").rm_file()<cr>'

--SPECTRE
-- lvim.keys.normal_mode["<leader>S"] = '<cmd>lua require("spectre").open()<CR>'
-- lvim.keys.normal_mode["<leader>sw"] = '<cmd>lua require("spectre").open_visual({select_word=true})<CR>'
-- lvim.keys.normal_mode["<leader>s"] = '<esc>:lua require("spectre").open_visual()<CR>'
-- lvim.keys.normal_mode["<leader>sp"] = 'viw:lua require("spectre").open_file_search()<cr>'

--GIT WORKTREE
lvim.keys.normal_mode["<leader>ye"] = ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>'
lvim.keys.normal_mode["<leader>yc"] = ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>'

-- BUILTINS
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{
		exe = "prettier",
		args = {
			"--bracket-same-line",
			"--no-semi",
			"--use-tabs=true",
			"--single-quote=true",
			"--indent-style=tabs",
			"--indent-size=4",
			"--trailing-comma=all",
			"--print-width=100",
		},
	},
}

-- Additional Plugins
lvim.plugins = {
	{ "folke/tokyonight.nvim" },
	{ "ThePrimeagen/harpoon" },
	{ "LinArcX/telescope-command-palette.nvim" },
	{ 'tpope/vim-fugitive' },
	{ 'skanehira/getpr' },
	{ 'skanehira/getpr.vim' },
	{ 'APZelos/blamer.nvim' },
	{ 'tpope/vim-surround' },
	{ 'windwp/nvim-spectre' },
	{ 'ThePrimeagen/git-worktree.nvim' },
	{ 'sindrets/diffview.nvim' },
	{ 'airblade/vim-gitgutter' },
	{ 'NLKNguyen/papercolor-theme' },
	{ 'tomasr/molokai' },
	{ 'nvim-treesitter/nvim-treesitter-context' },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
}
