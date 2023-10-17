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
	{ "kyazdani42/nvim-web-devicons", name = 'nvim-web-devicons-kyazdani42' },
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ 'nvim-treesitter/nvim-treesitter' },

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
		"Pocco81/auto-save.nvim",
	},
} }
local lazy_opts = {
	ui = {
		border = 'double'
	}
}
require("lazy").setup(plugins, lazy_opts)
