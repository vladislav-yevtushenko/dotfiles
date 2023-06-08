plugins = {{
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
     {'nvim-lualine/lualine.nvim',
       dependencies = { 'nvim-tree/nvim-web-devicons'}
     },
     {
	'marko-cerovac/material.nvim'
     }
    }

require("lazy").setup(plugins,opts)

