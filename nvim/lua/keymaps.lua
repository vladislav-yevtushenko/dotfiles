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

function P.map_lsp_keys()
	P.nmap_silent('<C-]', ':lua vim.lsp.buf.definition()<CR>')
end

-- JAVA function P.map_java_keys(bufnr)
function P.map_java_keys(bufnr)
	P.map_lsp_keys()
end

P.imap_silent('<C-S-l>', '<esc>:CocCommand editor.action.formatDocument<CR>')
P.vm('<C-h>', "y:%s/<c-r>=substitute(@\",\"\\\\n\",'\\\\n','g')<CR>")
P.nmap_silent('<leader>lg', ':LazyGit<CR>')
-- <F5> разные вариации нумераций строк, можно переключаться на ходу
P.nmap_silent('<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>')
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
P.nmap_silent('<Tab>', ':BufferLineCycleNext<CR>')
P.nmap_silent('<S-Tab>', ':BufferLineCyclePrev<CR>')

P.nmap_silent('<leader>ff', ':Telescope find_files<CR>')
P.nmap_silent('<leader>fg', ':Telescope live_grep<CR>')

P.nmap_silent('<leader>2', ':NeoTreeShow buffers<CR>')
P.nmap_silent('<leader>1', ':Neotree<CR>')

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
P.nmap_silent('<leader>6', ':TroubleToggle document_diagnostics<CR>')
P.nmap_silent('[d', '<Plug>(coc-diagnostic-prev)')
P.nmap_silent(']d', '<Plug>(coc-diagnostic-next)')

P.nmap_silent('gd', '<Plug>(coc-definition)')
P.nmap_silent('gy', '<Plug>(coc-type-definition)')
P.nmap_silent('gi', '<Plug>(coc-implementation)')
P.nmap_silent('gr', '<Plug>(coc-references)')

P.nmap_silent('<C-S-l>', ':CocCommand editor.action.formatDocument<CR>')

return P
