require("toggleterm").setup {
	direction = 'horizontal',
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
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 25
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		else
			return 20
		end
	end,
}
