return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#00000000",
		})
		vim.notify = require("notify")
	end,
}
