return {
  name = "NodeJs: Run current file",
  builder = function()
    local file = vim.fn.expand("%:p") -- absolute path to current file
    return {
      cmd = { "node", file },
      cwd = vim.fn.getcwd(), -- current working directory
      components = { "default" },
    }
  end,
  desc = "Run the current file with Node.js",
  condition = {
    filetype = { "javascript" },
  },
}
