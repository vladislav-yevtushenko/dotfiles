require('plugins.lsp.lua_ls')
require('plugins.lsp.terraform')
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}

lspconfig.tsserver.setup {}
