require('plugins.lsp.terraform')
--require('plugins.lsp.java')
require('plugins.lsp.jsonlsp')

local lspconfig = require('lspconfig')

require('lspconfig.ui.windows').default_options.border = 'double'

lspconfig.pyright.setup {}

lspconfig.tsserver.setup {}
