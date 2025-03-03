return {
  "folke/zen-mode.nvim",
  keys = {
    {
      "<leader>zz",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Toggle Zen Mode",
    },
  },
  opts = {
    window = {
      backdrop = 0.8, -- Dim the background slightly
      width = 0.85, -- 85% of screen width
      height = 0.90, -- 90% of screen height
      options = {
        signcolumn = "no", -- Hide the sign column
        number = false, -- Hide line numbers
        relativenumber = false,
        cursorline = false, -- No cursor line
      },
    },
    plugins = {
      gitsigns = { enabled = false }, -- Hide Git signs
      tmux = { enabled = false }, -- Hide tmux status bar
    },
  },
}
