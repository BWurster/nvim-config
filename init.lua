-- set up tab operations
vim.o.expandtab = true -- Set expandtab (replace tab characters with spaces)
vim.o.tabstop = 4 -- Set tabstop (number of spaces that a <Tab> in the file counts for)
vim.o.softtabstop = 4 -- Set softtabstop (number of spaces to use for each step of (auto)indent)
vim.o.shiftwidth = 4 -- Set shiftwidth (number of spaces used for each step of autoindent)
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins")



vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
