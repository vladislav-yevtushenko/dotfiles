require("toggleterm").setup {
	direction = 'float',
	open_mapping = [[<leader>t]],
	float_opts = {
		border = 'double'
	},
	highlights = {
		FloatBorder = {
			guibg = "red",
			guifg = "#FF0000"
		}
	},
	auto_scroll = true,

}
