require('plugins.lsp.lua_ls')
require('plugins.lsp.terraform')
local lspconfig = require('lspconfig')

require('lspconfig.ui.windows').default_options.border = 'double'

lspconfig.pyright.setup {}

lspconfig.tsserver.setup {}
