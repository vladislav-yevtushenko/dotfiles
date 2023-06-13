plugins = { {
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'nvim-telescope/telescope.nvim',  tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' } },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{ "catppuccin/nvim",         name = "catppuccin", priority = 1000 },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim"
		}
	},
	{ 'akinsho/bufferline.nvim', version = "*",       dependencies = 'nvim-tree/nvim-web-devicons' },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{ 'neovim/nvim-lspconfig' },
	{ 'arkav/lualine-lsp-progress' },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

} }

require("lazy").setup(plugins, opts)
