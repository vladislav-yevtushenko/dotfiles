return {
  "mfussenegger/nvim-dap",
  init = function()
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "Constant", linehl = "debugPC" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "" })
  end,
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "LiadOz/nvim-dap-repl-highlights",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap = require("dap")

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = vim.fn.exepath("js-debug-adapter"),
        args = { "${port}" },
      },
    }
    for _, filetype in ipairs({ "javascript", "typescript" }) do
      dap.configurations[filetype] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end

    require("overseer").enable_dap(true)
    require("dap.ext.vscode").json_decode = require("overseer.json").decode
  end,
}
