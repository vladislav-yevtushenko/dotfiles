return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      trigger_events = {
        defer_save = { "InsertLeave", "TextChanged" },
        cancel_deffered_save = { "InsertEnter" },
      },
      debounce_delay = 3000,
    },
  },
}
