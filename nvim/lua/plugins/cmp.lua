
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end,
	},
	window = {
		completion  = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered({ border = 'single'})
	},
	mapping = {

		-- Вызов меню автодополнения
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		--		['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

		-- Используем <C-e> для того чтобы прервать автодополнение
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(), -- Прерываем автодополнение
			c = cmp.mapping.close(), -- Закрываем автодополнение
		}),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },  -- LSP 👄
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'nvim_lsp_document_symbol' },
		{ name = 'luasnip' }, -- Luasnip 🐌
		{ name = 'buffer' },    -- Буфферы 🐃
		{ name = 'path' },      -- Пути 🪤
	}, {
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	}
}
