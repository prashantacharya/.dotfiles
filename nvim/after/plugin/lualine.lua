local lspStatus = {
	function()
		local msg = "No LSP detected"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	--icon = "",
	color = { fg = "#d3d3d3" },
}

local buffer = {
	"buffers",
	mode = 0,
	show_filename_only = true,
	show_modified_status = true,
	hide_filename_extension = false,
	symbols = { alternate_file = "" },
	buffers_color = {
		active = { fg = "#d3d3d3" },
		inactive = { fg = "#414141" },
	},
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { buffer },
		lualine_x = { "diff", "diagnostics" },
		lualine_y = { "filetype" },
		lualine_z = { "progress" },
	},
})
