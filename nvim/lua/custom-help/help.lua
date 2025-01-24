local CustomHelp = {}

local data = {
	{ "Keybinding", "Description" },
	{ "<leader>x", "close buffer" },
	{ "<leader>v", "split window vertically" },
	{ "<leader>h", "split window horizontally" },
	{ "<leader>se", "make split windows equal width & height" },
	{ "<leader>xs", "close current split window" },
	{ "", "" },
	{ "", "" },
	{ "", "" },
	{ "", "" },
	{ "", "" },
	{ "", "" },
	{ "", "" },
	{ "", "" },
	{ "", "" },
}
local function format_row(col1, col2)
	return string.format("%-20s %-40s", col1, col2)
end

function CustomHelp.show_help_window()
	local text = CustomHelp.generate_text()

	local help_lines = {}
	for _, row in ipairs(data) do
		table.insert(help_lines, format_row(row[1], row[2]))
	end
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, help_lines)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	local width = math.floor(vim.o.columns * 0.5)
	local height = math.floor(vim.o.lines * 0.3)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

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
