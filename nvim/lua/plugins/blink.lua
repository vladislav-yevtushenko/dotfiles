return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        ghost_text = { enabled = false },
        trigger = {
          show_on_insert = false,
          show_on_keyword = false,
          show_on_trigger_character = false,
        },
      },
      keymap = {
        preset = "default",
        ["<C-Space>"] = { "show" }, -- открываем popup вручную
        ["<CR>"] = { "accept", "fallback" },
        ["<C-m>"] = { "select_next", "fallback" },
        ["<C-n>"] = { "select_prev", "fallback" },
      },
    },
  },
}
