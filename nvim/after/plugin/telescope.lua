local telescope_builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({ defaults = { file_ignore_patterns = { "node_modules" } } })

vim.keymap.set("n", "<leader>ff", telescope_builtin.git_files, {})
vim.keymap.set("n", "<C-p>", telescope_builtin.find_files, {})
vim.keymap.set("n", "<C-f>", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
