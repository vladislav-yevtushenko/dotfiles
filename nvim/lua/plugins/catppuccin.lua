require("catppuccin").setup({
	flavour = 'frappe',
	integrations = {
		cmp         = true,
		coc_nvim    = true,
		notify      = true,
		lsp_trouble = true,
		telescope   = true,
		neotree     = true,
		mason       = true,
		native_lsp  = {
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
		frappe = function(frappe)
			return {
			VertSplit = { fg = frappe.sapphire}
		}
		end,
		mocha = function(mocha)
			return {
				StatusLineNC = { fg = mocha.mauve, bg = mocha.mauve },
				StatusLine = { fg = mocha.mauve, bg = mocha.mauve },
				VertSplit = { fg = "#000000" },
				NormalFloat = {},
				FloatBorder = { fg = mocha.mauve },
				Comment = { fg = mocha.flamingo }
			}
		end,
	}
})
vim.cmd.colorscheme 'catppuccin'
