return {
	-- Colorscheme (after/plugin/colors.lua)
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },

	-- Treesitter stack (after/plugin/treesitter*.lua, autotag.lua)
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"windwp/nvim-ts-autotag",
		},
	},
	{ "nvim-treesitter/nvim-treesitter-context", lazy = false },
	{ "windwp/nvim-ts-autotag", lazy = false },

	-- Editor UI
	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-tree/nvim-web-devicons", lazy = false },
	{ "nvim-tree/nvim-tree.lua", lazy = false },
	{ "nvim-lualine/lualine.nvim", lazy = false },
	{ "feline-nvim/feline.nvim", lazy = false },
	{ "lukas-reineke/indent-blankline.nvim", lazy = false },

	-- Editing
	{ "windwp/nvim-autopairs", lazy = false },
	{ "terrortylor/nvim-comment", lazy = false },

	-- Git
	{ "lewis6991/gitsigns.nvim", lazy = false },
	{ "sindrets/diffview.nvim", lazy = false, dependencies = { "nvim-lua/plenary.nvim" } },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- AI completion
	{ "supermaven-inc/supermaven-nvim", lazy = false },

	-- Utilities
	{ "mbbill/undotree", lazy = false },

	{ "mrjones2014/smart-splits.nvim", lazy = false },

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
