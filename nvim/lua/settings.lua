vim.g.mapleader = ' '
local opt = vim.opt

opt.relativenumber = true
opt.termguicolors = true
opt.mouse = nv
opt.showcmd = true
opt.swapfile = false
opt.number = true
opt.wrap = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.so = 5
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.fixeol = false
opt.completeopt = 'menuone,noselect'

opt.timeoutlen = 3300


vim.timeoutlen = 3000
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup end
]], false)

vim.diagnostic.config(
	{
		virtual_text = false,
		float = { border = 'single' }
	})
