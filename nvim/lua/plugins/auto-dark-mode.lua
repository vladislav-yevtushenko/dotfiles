return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000, -- ms
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("gruvbox")
      end,
    },
  },
}
