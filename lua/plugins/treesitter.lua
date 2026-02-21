return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.config")

		configs.setup({
			auto_install = true,
			ensure_installed = {
				"javascript",
				"typescript",
				"python",
				"html",
				"css",
				"json",
				"java",
				"c",
				"cpp",
				"ruby",
				"lua",
				"go",
				"rust",
				"bash",
				"markdown",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
