return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "NONE", -- Makes it transparent
    })
    vim.notify = require("notify") -- Override the default notification function
  end,
}
