vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		side = "right",
		width = 50,
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				-- open file when pressing e
				{ key = "e", action = "open" },
				{ key = "U", action = "cd" },
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				folder_arrow = true,
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})
