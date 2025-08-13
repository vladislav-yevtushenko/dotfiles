return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true, -- Optional, highlights the file you're editing in the tree
        },
        use_libuv_file_watcher = true,
      },
      event_handlers = {},
    },
  },
}
