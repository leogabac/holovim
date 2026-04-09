vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", { desc = "Write without autocmds", unpack(opts) })
vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("n", "<Up>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +2<CR>", opts)

vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer", unpack(opts) })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer", unpack(opts) })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete!<CR>", { desc = "Delete buffer", unpack(opts) })
vim.keymap.set("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer", unpack(opts) })

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split vertically", unpack(opts) })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split horizontally", unpack(opts) })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits", unpack(opts) })
vim.keymap.set("n", "<leader>xs", "<cmd>close<CR>", { desc = "Close split", unpack(opts) })

vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts)

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab", unpack(opts) })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab", unpack(opts) })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next tab", unpack(opts) })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous tab", unpack(opts) })

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap", unpack(opts) })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set({ "n", "x" }, "<leader>p", [["0p]], { desc = "Paste from yank register" })

vim.keymap.set("n", "<leader>;", "A;<Esc>", { desc = "Append semicolon", unpack(opts) })
vim.keymap.set("n", "<leader>,", "A,<Esc>", { desc = "Append comma", unpack(opts) })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard", unpack(opts) })
vim.keymap.set("n", "<leader>ly", '"+yy', { desc = "Yank line to clipboard", unpack(opts) })
vim.keymap.set("n", "<leader>ya", 'ggVG"+y', { desc = "Yank all to clipboard", unpack(opts) })
