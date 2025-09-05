return {
  {
    "nvim-neotest/neotest",
    dependencies = { "haydenmeade/neotest-jest" },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js", -- или jest.config.ts
            cwd = function(path)
              return vim.fn.getcwd()
            end,
            env = { CI = true },
            dap = {
              type = "pwa-node",
              request = "launch",
              name = "Debug Jest Tests",
              runtimeExecutable = "node",
              runtimeArgs = { "./node_modules/jest/bin/jest.js", "--runInBand" },
              cwd = vim.fn.getcwd(),
              console = "integratedTerminal",
              internalConsoleOptions = "neverOpen",
            },
          }),
        },
      })
    end,
  },
}
