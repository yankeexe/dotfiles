require("toggleterm").setup({
	open_mapping = [[<leader>t]],
	direction = "float",
	float_opts = {
		border = "double",
		winblend = 3,
		title_pos = "center",
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local python = Terminal:new({
	cmd = "bpython",
	hidden = true,
	close_on_exit = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<leader>y", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

function _python_toggle()
	python:toggle()
end

local lazygit = Terminal:new({ cmd = "lg", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>y", "<cmd>lua _python_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
