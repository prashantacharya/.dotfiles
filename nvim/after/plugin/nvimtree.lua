vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	api.map.on_attach.default(bufnr)

	vim.keymap.set("n", "u", api.tree.change_root_to_parent, { buffer = bufnr, desc = "Parent directory" })
	vim.keymap.set("n", "e", api.node.open.edit, { buffer = bufnr, desc = "Open" })
	vim.keymap.set("n", "U", api.tree.change_root_to_node, { buffer = bufnr, desc = "Change directory" })
end

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	on_attach = on_attach,
	view = {
		side = "right",
		width = 50,
		adaptive_size = false,
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
