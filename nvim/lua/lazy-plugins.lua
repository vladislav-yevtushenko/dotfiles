local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = { {
	--	{ 'mfussenegger/nvim-jdtls'},
	--	{ 'ray-x/lsp_signature.nvim' },
	{
		'tomiis4/Hypersonic.nvim',
		event = "CmdlineEnter",
		cmd = "Hypersonic",
	},
	{ 'tpope/vim-surround' },
	{ 'puremourning/vimspector' },
	{ 'nvim-lua/lsp-status.nvim' },
	{ 'sindrets/diffview.nvim' },
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true
	},
	{
		'neoclide/coc.nvim',
		branch = 'release'
	},
	{ 'vim-test/vim-test' },
	{ "kyazdani42/nvim-web-devicons", name = 'nvim-web-devicons-kyazdani42' },
	--	{ "folke/trouble.nvim", },
	{ 'onsails/lspkind-nvim' },
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ 'nvim-treesitter/nvim-treesitter' },
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	{ 'gbrlsnchs/telescope-lsp-handlers.nvim' },
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' }
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim"
		}
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		priority = 2000
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		'neovim/nvim-lspconfig'
	},
	{
		'arkav/lualine-lsp-progress'
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"Pocco81/auto-save.nvim",
	},
	{
		"rcarriga/nvim-notify"
	},
} }
local lazy_opts = {
	ui = {
		border = 'double'
	}
}
require("lazy").setup(plugins, lazy_opts)
