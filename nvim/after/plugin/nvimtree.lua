vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				-- open file when pressing e
				{ key = "e", action = "edit" },
				{ key = "u", action = "dir_up" },
				{ key = "U", action = "cd" },
			},
		},
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 220,
				height = 35,
				row = 5,
				col = 75,
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
