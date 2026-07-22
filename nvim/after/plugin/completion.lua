require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<Tab>"] = { "select_and_accept" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
	},

	-- <Tab>/<C-]>/<C-j> stay free for supermaven-nvim's ghost-text (see supermaven.lua)
	completion = {
		documentation = { auto_show = true },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	signature = { enabled = true },
})
