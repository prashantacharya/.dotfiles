return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local lspStatus = {
      function()
        local msg = "No LSP detected"
        local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if not clients or vim.tbl_isempty(clients) then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.tbl_contains(filetypes, buf_ft) then
            return client.name
          end
        end
        return msg
      end,
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
        lualine_x = { "diff", "diagnostics", lspStatus },
        lualine_y = { "filetype" },
        lualine_z = { "progress" },
      },
    })
  end,
}

