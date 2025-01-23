-- lua/plugins/help.lua
local CustomHelp = {}

function CustomHelp.show_help_window()
	-- your floating window code here
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
		"This is custom help",
		"Press <q> to close",
	})
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	-- calculate window size/pos
	local width = math.floor(vim.o.columns * 0.5)
	local height = math.floor(vim.o.lines * 0.3)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- open floating window
	vim.api.nvim_open_win(buf, true, {
		style = "minimal",
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		border = "rounded",
	})

	-- optional keymap to close
	vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", {
		nowait = true,
		noremap = true,
		silent = true,
	})
end

return CustomHelp
