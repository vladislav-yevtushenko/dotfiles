local map = vim.api.nvim_set_keymap


--[[
Метод для установки горячих клавиш (normal)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
function nm(key, command) 
	map('n', key, command, {noremap = true})
end

--[[
Метод для установки горячих клавиш (input)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
function im(key, command)
	map('i', key, command, {noremap = true})
end

--[[
Метод для установки горячих клавиш (visual)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
function vm(key, command)
	map('v', key, command, {noremap = true})
end

--[[
Метод для установки горячих клавиш (terminal)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
local function tm(key, command)
	map('t', key, command, {noremap = true})
end

nm('<leader>lg',':LazyGit<CR>')


local noremap_silent = { noremap = true, silent = true }
map('v', '<C-h>', "y:%s/<c-r>=substitute(@\",\"\\\\n\",'\\\\n','g')<CR>", { noremap = true, silent = false })
-- Отключаем стрелочки в Нормальном Режиме. Хардкор!
map('', '<up>', ':echoe "Use hjkl, bro"<CR>', { noremap = true, silent = false })
map('', '<down>', ':echoe "Use hjkl, bro"<CR>', { noremap = true, silent = false })
map('', '<left>', ':echoe "Use hjkl, bro"<CR>', { noremap = true, silent = false })
map('', '<right>', ':echoe "Use hjkl, bro"<CR>', { noremap = true, silent = false })

-- <F5> разные вариации нумераций строк, можно переключаться на ходу
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', noremap_silent)
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', noremap_silent)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', noremap_silent)

map('n', '<leader>ff', ':Telescope find_files<CR>', noremap_silent)
map('n', '<leader>fg', ':Telescope live_grep<CR>', noremap_silent)

map('n', '<leader>2', ':NeoTreeShow buffers<CR>', noremap_silent)
map('n', '<leader>1', ':Neotree<CR>', noremap_silent)
map('n', '<leader>so', ':SymbolsOutline<CR>', noremap_silent)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<leader>6', ':TroubleToggle document_diagnostics<CR>', noremap_silent)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- Use `[g` and `]g` to navigate diagnostics
--  Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
map('n', '[d', '<Plug>(coc-diagnostic-prev)', noremap_silent)
map('n', ']d', '<Plug>(coc-diagnostic-next)', noremap_silent)

map('n', 'gd', '<Plug>(coc-definition)', noremap_silent)
map('n', 'gy', '<Plug>(coc-type-definition)', noremap_silent)
map('n', 'gi', '<Plug>(coc-implementation)', noremap_silent)
map('n', 'gr', '<Plug>(coc-references)', noremap_silent)

