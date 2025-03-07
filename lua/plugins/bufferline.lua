return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- Set to "tabs" for tab mode
				numbers = "ordinal", -- Show buffer numbers
				diagnostics = "nvim_lsp", -- Show LSP diagnostics
				separator_style = "thin", -- Can be "slant", "thick", "thin", etc.
				show_close_icon = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
				indicator = {
					icon = "▄", -- You can also use "▂", "▃", "▄", or even "" for no icon
					style = "underline", -- This enables the underline effect
				},
				always_show_bufferline = true,
			},
		})

		vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { silent = true })
		vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { silent = true })
		vim.keymap.set("n", "<leader>bf", ":BufferLinePick<CR>", { silent = true })
	end,
}
