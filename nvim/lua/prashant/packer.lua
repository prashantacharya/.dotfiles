-- This file can be loaded by calling `lua require('plugins')` from your init.vim Only required if you have packer configured as `opt` vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")
	use("mbbill/undotree")

	use({ "neoclide/coc.nvim", branch = "release" })

	use("folke/zen-mode.nvim")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use("RyanMillerC/better-vim-tmux-resizer")
	use("christoomey/vim-tmux-navigator")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("lukas-reineke/indent-blankline.nvim")

  use("folke/tokyonight.nvim")

	use("jose-elias-alvarez/null-ls.nvim")

	use("windwp/nvim-autopairs")

	use("terrortylor/nvim-comment")

	use("fatih/vim-go")

	use("windwp/nvim-ts-autotag")

	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	})

	use("RRethy/vim-illuminate")

	use("ray-x/lsp_signature.nvim")

	use({
		"lewis6991/gitsigns.nvim",
	})
	use("jose-elias-alvarez/typescript.nvim")
	use({
		"mattn/emmet-vim",
		config = function()
			vim.g.user_emmet_leader_key = ","

			vim.g.user_emmet_settings = {
				indent_blockelement = 1,
			}
		end,
	})
end)
