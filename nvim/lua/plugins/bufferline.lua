require("bufferline").setup {
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		groups = {
			items = {
				require('bufferline.groups').builtin.pinned:with({ icon = "" })
			}
		},
		indicator = {
			style = 'underline'
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				separator = true,
				text_align = "center"
			}
		}
	}
}
