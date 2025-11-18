return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Setup Mason
			require("mason").setup()

			-- Shared capabilities for all LSPs
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 1. DEFINE LspAttach Autocommand (Replaces on_attach)
			local lsp_attach_group = vim.api.nvim_create_augroup("LspAttachGroup", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lsp_attach_group,
				callback = function(args)
					local bufnr = args.buf

					-- Keymaps (now defined here, outside of a setup handler)
					local opts = { buffer = bufnr, noremap = true, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					-- Diagnostic float on CursorHold (also defined here)
					vim.api.nvim_create_autocmd("CursorHold", {
						buffer = bufnr,
						callback = function()
							local width = math.floor(vim.api.nvim_win_get_width(0) * 0.5)
							vim.diagnostic.open_float(nil, {
								focus = false,
								border = "rounded",
								max_width = width,
							})
						end,
					})
				end,
			})
			-- END of LspAttach Autocommand

			-- UI: Prettify diagnostics and LSP popups (No change needed here)
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- You can also try "■", "▎", or "" to disable
					spacing = 2,
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			-- Optional: Custom icons for diagnostic signs in the gutter
			local signs = { Error = " ", Warn = " ", Hint = "󰌶", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Custom Configurations for specific servers
			local server_settings = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				},
				pyright = {},
				tsserver = {},
				html = {},
				cssls = {},
				gopls = {
					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
								shadow = true,
							},
							staticcheck = true,
						},
					},
				},
			}

			-- THE FIX: Consolidate setup and handlers into one call
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tsserver",
					"html",
					"cssls",
					"gopls",
				},
				automatic_installation = true,
				-- Define handlers here to override the deprecated default
				handlers = {
					-- Default handler runs for all servers not explicitly listed below
					function(server_name)
						local custom_config = server_settings[server_name] or {}

						-- Create the final configuration options.
						local config_options = vim.tbl_extend("force", {
							capabilities = capabilities,
						}, custom_config)

						-- Use the new, recommended LSP API: vim.lsp.config()
						vim.lsp.config(server_name, config_options)
					end,
				},
			})
		end,
	},
}
