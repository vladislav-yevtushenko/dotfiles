-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Terminal = require("snacks.terminal")

local function switch_terminal(style)
  local opts
  if style == "float" then
    opts = { win = { style = "float", border = "rounded", width = 0.8, height = 0.8 } }
  elseif style == "vsplit" then
    opts = { win = { style = "split", position = "right", size = 0.5 } }
  elseif style == "hsplit" then
    opts = { win = { style = "split", position = "bottom", size = 0.3 } }
  elseif style == "tab" then
    opts = { win = { style = "tab" } }
  end

  -- просто всегда закрываем и открываем заново с новым стилем
  Terminal.toggle(nil, opts)
end

-- keymaps
vim.keymap.set("n", "<leader>ftf", function()
  switch_terminal("float")
end, { desc = "Terminal float" })
vim.keymap.set("n", "<leader>ftv", function()
  switch_terminal("vsplit")
end, { desc = "Terminal vsplit" })
vim.keymap.set("n", "<leader>fth", function()
  switch_terminal("hsplit")
end, { desc = "Terminal hsplit" })
vim.keymap.set("n", "<leader>ftt", function()
  switch_terminal("tab")
end, { desc = "Terminal tab" })
