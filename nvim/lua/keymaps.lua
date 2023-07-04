local P = {}
keymaps = P
local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }
local noremap_silent = { noremap = true, silent = true }
--- Отключаем стрелочки в Нормальном Режиме. Хардкор!
map('', '<up>', ':echoe "Use hjkl, bro"<CR>', noremap)
map('', '<down>', ':echoe "Use hjkl, bro"<CR>', noremap)
map('', '<left>', ':echoe "Use hjkl, bro"<CR>', noremap)
map('', '<right>', ':echoe "Use hjkl, bro"<CR>', noremap)

function P.nmap_silent(key, command)
	map('n', key, command, noremap_silent)
end

function P.im(key, command, opts)
	map('i', key, command, opts)
end

function P.imap_silent(key, command)
	P.im(key, command, noremap_silent)
end

function P.vm(key, command)
	map('v', key, command, noremap)
end

function P.tm(key, command)
	map('t', key, command, noremap)
end

P.vm('<C-h>', "y:%s/<c-r>=substitute(@\",\"\\\\n\",'\\\\n','g')<CR>")
P.nmap_silent('<leader>lg', ':LazyGit<CR>')
-- <F5> разные вариации нумераций строк, можно переключаться на ходу
P.nmap_silent('<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>')

-- Telescope start section
P.nmap_silent('<leader>lb', ':Telescope buffers<CR>')
P.nmap_silent('<leader>ff', ':Telescope find_files<CR>')
P.nmap_silent('<leader>fg', ':Telescope live_grep<CR>')
P.nmap_silent('<leader>rg', ':Telescope registers<CR>')
-- Telescope end section

-- Neotree
P.nmap_silent('<leader>2', ':NeoTreeShow buffers<CR>')
P.nmap_silent('<leader>1', ':Neotree<CR>')
-- Neotree

P.nmap_silent('<leader>ft', ':ToggleTerm direction=float<CR>')
P.nmap_silent('<leader>ht', ':ToggleTerm direction=horizontal<CR>')
return P
