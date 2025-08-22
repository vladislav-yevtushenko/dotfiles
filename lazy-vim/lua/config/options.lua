-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "snacks"

local opt = vim.opt
opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#333333" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#333333" })
  end,
})

-- Add borders to all LSP floating windows
local _border = "single"

-- Diagnostic config with borders
vim.diagnostic.config({
  float = {
    border = _border,
  },
})
