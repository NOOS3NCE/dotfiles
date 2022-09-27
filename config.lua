--LVIM SETUP
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "synthwave84"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.softtabstop = -1
lvim.leader = "space"

-- KEY BINDINGS
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
lvim.keys.normal_mode["<C-j>"] = ':lua require("harpoon.ui").nav_file(1)<CR>'
lvim.keys.normal_mode["<C-k>"] = ':lua require("harpoon.ui").nav_file(2)<CR>'
lvim.keys.normal_mode["<C-l>"] = ':lua require("harpoon.ui").nav_file(3)<CR>'
lvim.keys.normal_mode["<C-;>"] = ':lua require("harpoon.ui").nav_file(4)<CR>'
lvim.keys.normal_mode["<C-e>"] = ':lua require("harpoon.ui").toggle_quick_menu()<CR>'
lvim.keys.normal_mode["<C-m>"] = ':lua require("harpoon.mark").add_file()<CR>'
lvim.keys.normal_mode["<leader><C-r>"] = ':lua require("harpoon.mark").rm_file()<CR>'

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
		command = "prettier",
		extra_args = { "--print-with", "100" },
	},
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
	{ "folke/tokyonight.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "ThePrimeagen/harpoon" },
	{ "nvim-telescope/telescope.nvim" },
	{ "LinArcX/telescope-command-palette.nvim" },
	{ 'artanikin/vim-synthwave84' },
	{ 'tpope/vim-fugitive' },
	{ 'skanehira/getpr' },
	{ 'skanehira/getpr.vim' },
	{ 'APZelos/blamer.nvim' },
	{ 'tpope/vim-surround' },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
}

require("telescope").load_extension('harpoon')
require('telescope').load_extension('command_palette')
