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

require("root-dir")
require("options")
require("lazy").setup("plugins")

-- absolute line numbers in insert more
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = false
        vim.opt.number = true
    end,
})

-- relative line numbers in normal mode
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = true
        vim.opt.number = true
    end,
})


-- limit viewable file size
local max_filesize = 1024 * 1024 * 5 -- 5MB limit (adjust as needed)

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function(args)
    local filepath = vim.fn.expand("<afile>")
    local size = vim.fn.getfsize(filepath)
    if size > max_filesize then
      vim.cmd("echohl WarningMsg | echo 'File too large! Not opening.' | echohl None")
      vim.cmd("bwipeout " .. args.buf) -- Close the buffer
    end
  end,
})

-- save after leaving insert mode
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
    pattern = "*",
    command = "silent! w"
})


