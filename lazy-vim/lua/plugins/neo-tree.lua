return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          ennabled = true, -- Optional, highlights the file you're editing in the tree
        },
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            vim.cmd("Neotree close")
          end,
        },
      },
    },
  },
}
