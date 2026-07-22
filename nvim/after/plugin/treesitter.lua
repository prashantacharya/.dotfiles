require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- Requires `tree-sitter` CLI (e.g. `brew install tree-sitter`), then run `:TSUpdate`
vim.schedule(function()
	pcall(function()
		require("nvim-treesitter").install({
			"c",
			"cpp",
			"lua",
			"rust",
			"go",
			"python",
			"javascript",
			"typescript",
			"tsx",
			"zig",
		})
	end)
end)
