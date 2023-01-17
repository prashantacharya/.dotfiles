vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-e>", vim.cmd.NvimTreeToggle)

-- COPY PASTE clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- K and J to move lines up and down
vim.keymap.set("n", "<C-k>", ":move -2<CR>==")
vim.keymap.set("n", "<C-j>", ":move +1<CR>==")

-- close current buffer on ctrl+w
vim.keymap.set("n", "<C-w>", ":bdelete<CR>")
