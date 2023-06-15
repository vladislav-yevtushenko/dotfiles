local telescope = require('telescope')
telescope.setup({
	extensions = {
		lsp_handlers = {
			code_action = {
				telescope = require('telescope.themes').get_dropdown({}),
			},
		},
	},
})
telescope.load_extension('notify')
telescope.load_extension('fzf')
telescope.load_extension('lsp_handlers')
