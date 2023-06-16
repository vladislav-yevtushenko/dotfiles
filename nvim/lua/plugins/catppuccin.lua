require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		cmp = true,
		coc_nvim  = false,
		notify = true,
		lsp_trouble = true,
		telescope = true,
		neotree = true,
		mason = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
	highlight_overrides = {
		mocha = function(mocha)
			return {
				VertSplit = { fg = mocha.mauve },
				NormalFloat = { bg = mocha.mauve }
			}
		end,
	}
})
vim.cmd.colorscheme 'catppuccin'
