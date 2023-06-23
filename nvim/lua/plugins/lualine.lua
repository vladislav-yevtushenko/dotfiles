
require("lualine").setup {
	options = {
		theme = 'catppuccin',
		icons_enabled = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { 'mode', },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'g:coc_status',  'data', "require'lsp-status'.status()" },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	extensions = {
		"neo-tree",
		"lazy",
		"toggleterm",
	},

	winbar = {

		lualine_x = { {
			'filename',
			file_status = true, -- Displays file status (readonly status, modified status)
			newfile_status = false, -- Display new file status (new file means no write after created)
			path = 1,
		} },
	}
}
