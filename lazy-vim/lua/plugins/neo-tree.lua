return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true, -- Optional, highlights the file you're editing in the tree
        },
      },
      event_handlers = {},
    },
  },
}
