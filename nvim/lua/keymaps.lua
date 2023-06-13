local map = vim.api.nvim_set_keymap
local noremap_silent = { noremap = true, silent = true }

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

map('n', '<leader>f', ':Telescope find_files<CR>', noremap_silent)

map('n', '<leader>e', ':NeoTreeFloatToggle buffers<CR>', noremap_silent)
map('n', '<leader>1', ':NeoTreeRevealToggle<CR>', noremap_silent)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<C-f>', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<S-r>', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<C-S-l>', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
