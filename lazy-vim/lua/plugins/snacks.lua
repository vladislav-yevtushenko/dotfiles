return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    statuscolumn = { enabled = true },
    scroll = { enabled = false },
    explorer = { enabled = true },
    picker = {
      icons = {
        tree = {
          vertical = "│",
          middle = "├",
          last = "└",
        },
        files = {
          enabled = true,
          dir = "󰉋 ",
          dir_open = "󰝰 ",
          file = "󰈔 ",
        },
      },
      sources = {
        explorer = {
          git_status_open = true,
          formatters = {
            files = {},
          },
          layout = {
            layout = {
              width = 65,
              position = "left",
            },
          },
        },
      },
    },
  },
}
