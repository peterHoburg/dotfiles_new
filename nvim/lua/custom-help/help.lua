local CustomHelp = {}

local data = {
	{ "<leader>x", "close buffer" },
	{ "<leader>v", "split window vertically" },
	{ "<leader>h", "split window horizontally" },
	{ "<leader>se", "make split windows equal width & height" },
	{ "<leader>xs", "close current split window" },
	{ "<leader>lw", "toggle line wrap" },
	{ "<leader>j", "Replace word under cursor" },
	{ "[d", "Go to previous diagnostic message" },
	{ "]d", "Go to next diagnostic message" },
	{ "<leader>d", "Open floating diagnostic message" },
	{ "<leader>q", "Open diagnostic list" },
	{ "<leader>ss", "(S)ession (S)ave" },
	{ "<leader>sl", "(S)ession (L)oad" },
	{ "", "" },
}
local function format_row(col1, col2)
	return string.format("%-20s %-40s", col1, col2)
end

function CustomHelp.show_help_window()
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
	vim.api.nvim_buf_set_keymap(buf, "n", "<ESC>", "<cmd>close<CR>", {
		nowait = true,
		noremap = true,
		silent = true,
	})
end

return CustomHelp
