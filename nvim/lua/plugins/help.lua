-- lua/plugins/custom_help.lua
return {
	-- This time we specify a local path
	name = "custom-help",
	dir = "~/.config/nvim/lua/custom-help/", -- or any absolute/relative path to that folder
	dev = true, -- optional: prevents Lazy from treating it as a remote
	config = function()
		require("custom-help").setup()
		vim.keymap.set("n", "<leader>H", function()
			require("custom-help.help").show_help_window()
		end, { desc = "Open custom help" })
	end,
}
