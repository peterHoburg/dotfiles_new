local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>he", function()
		require("custom-help.help").show_help_window()
	end, { desc = "Open custom help popup" })
end

return M
