-- set up tab operations
vim.o.expandtab = true -- Set expandtab (replace tab characters with spaces)
vim.o.tabstop = 4 -- Set tabstop (number of spaces that a <Tab> in the file counts for)
vim.o.softtabstop = 4 -- Set softtabstop (number of spaces to use for each step of (auto)indent)
vim.o.shiftwidth = 4 -- Set shiftwidth (number of spaces used for each step of autoindent)
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartindent = true -- Insert indents automatically
vim.o.mouse = "a"
vim.o.pumheight = 10 -- Maximum number of entries in popup menu
vim.g.mapleader = " "

vim.g.root_spec = { "lsp", { ".git" }, "cwd" }

local map = vim.keymap.set


-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })


-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })


-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height", remap = true })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height", remap = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width", remap = true })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width", remap = true })


-- Move Lines
-- The symbols ∆ ˚ are used because <A-j> and <A-k> are not available on mac
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })


-- floating terminal
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
-- map("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

