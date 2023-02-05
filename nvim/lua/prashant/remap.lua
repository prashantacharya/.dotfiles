vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- COPY PASTE clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- K and J to move lines up and down
vim.keymap.set("n", "J", ":move +1<CR>==")
vim.keymap.set("n", "K", ":move -2<CR>==")

-- close current buffer on ctrl+w
vim.keymap.set("n", "<C-w>", ":bdelete<CR>")

vim.keymap.set("n", "<M-j>", ":m+<CR>") -- move line down
vim.keymap.set("n", "<M-k>", ":m-2<CR>") -- move line up
vim.keymap.set("x", "<M-j>", ":m '>+1<CR>gv=gv") -- move code block down
vim.keymap.set("x", "<M-k>", ":m '<-2<CR>gv=gv") -- move code block up

-- switch buffer
vim.keymap.set("n", "<M-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>bprev<CR>")
