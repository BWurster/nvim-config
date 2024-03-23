return {
  'nvim-telescope/telescope.nvim', 
    keys = {
      {
        {'<leader>fg', "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
        {'<leader>ff', "<cmd>Telescope find_files<cr>" desc = "Find file"},
      },
    },    
}
