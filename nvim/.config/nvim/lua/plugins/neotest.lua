return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest", -- Make sure this is included
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --", -- Adjust based on your project
          jestConfigFile = "jest.config.js", -- Path to your Jest config
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
      -- Optional: Specify file detection
      discovery = {
        enabled = true,
      },
    })
  end,
}
