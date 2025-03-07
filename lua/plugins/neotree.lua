return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                mappings = {
                    ["<space>"] = "none",
                    ["q"] = "close_window",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                },
                follow_current_file = true, -- Keep the current file in focus
                use_libuv_file_watcher = true, -- Automatically detect changes
            },
        })
        vim.keymap.set("n", "<leader>fe", ":Neotree toggle<CR>", { desc = "File Explorer" })
    end,
}
