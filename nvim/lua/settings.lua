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

-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup end
]], false)
