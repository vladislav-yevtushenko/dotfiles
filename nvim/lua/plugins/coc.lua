local keyset = require('keymaps')

-- Autocomplete
function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }



keyset.im('<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset.im('<S-Tab>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset.im('<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)


keyset.im('<c-space>', 'coc#refresh()', { silent = true, expr = true })
