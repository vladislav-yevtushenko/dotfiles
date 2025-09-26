return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {},
    default_component_configs = {
      indent = {
        indent_size = 1, -- default is 2, reduce it for compactness
        padding = 0, -- remove extra padding on the left
        with_markers = true, -- keep vertical guide lines
      },
    },
  },
}
