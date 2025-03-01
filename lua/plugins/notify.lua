return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "NONE",
		})
		vim.notify = require("notify")
	end,
}
