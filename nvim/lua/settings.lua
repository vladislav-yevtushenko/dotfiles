local function add(value, str, sep)
  sep = sep or ','
  str = str or ''
  value = type(value) == 'table' and table.concat(value, sep) or value
  return str ~= '' and table.concat({ value, str }, sep) or value
end
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

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.list = true
vim.o.listchars = add {
	'eol: ',
	'tab:| ',
}
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




