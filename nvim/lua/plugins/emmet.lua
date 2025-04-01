return {
	"mattn/emmet-vim",
	init = function()
		vim.g.user_emmet_leader_key = ","
		vim.g.user_emmet_settings = {
			indent_blockelement = 1,
		}
	end,
	event = "InsertEnter", -- optional: lazy-load on insert
}
