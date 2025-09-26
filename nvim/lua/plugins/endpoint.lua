return {
  "zerochae/endpoint.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  cmd = { "Endpoint" },
  config = function()
    require("endpoint").setup({
      framework = "auto",
      cache_mode = "session", -- Use session cache for better performance
      ui = {
        use_nerd_font = true,
        show_icons = true,
        method_icons = {
          emoji = {
            GET = "🔍 ",
            POST = "🚀 ",
            PUT = "✏️ ",
            DELETE = "🗑️ ",
            PATCH = "🩹 ",
            HEAD = "📦 ",
          },
          nerd_font = {
            GET = " ",
            POST = " ",
            PUT = " ",
            DELETE = " ",
            PATCH = " ",
            HEAD = " ",
            OPTIONS = " ",
          },
        },
      },
    })
  end,
}
