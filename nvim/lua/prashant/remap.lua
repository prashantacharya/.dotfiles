vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- COPY PASTE clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- K and J to move lines up and down
vim.keymap.set("n", "J", ":move +1<CR>==")
vim.keymap.set("n", "K", ":move -2<CR>==")
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv")

-- close current buffer on ctrl+w
vim.keymap.set("n", "<C-w>", ":bdelete<CR>")

-- switch buffer
vim.keymap.set("n", "<leader>l", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>bprev<CR>")

--  git signals
vim.keymap.set("n", "gn", "<cmd>Gitsigns next_hunk<CR>")
vim.keymap.set("n", "gN", "<cmd>Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>")
vim.keymap.set("n", "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>")
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_branches<CR>")
