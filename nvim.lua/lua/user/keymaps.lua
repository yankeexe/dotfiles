local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Normal Mode
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Nvim Tree Lua mappings
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<Space><Space>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Order buffer by their number
keymap("n", "<leader>ob", "<Cmd>BufferOrderByBufferNumber<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to go to Normal Mode
keymap("i", "jk", "<ESC>", opts)

-- Hold on to what has been yanked instead of registering overwritten value
keymap("v", "p", '"_dP', opts)

-- Copy current buffer path to clipboard
keymap("n", "<leader>cbp", "<cmd>let @+=expand('%:p')<CR>")

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>p", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>f", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
keymap("n", "<leader>d", "<cmd>Telescope diagnostics<CR>")
keymap("n", "<leader>b", "<cmd>Telescope buffers<CR>")
keymap("n", "gr", "<cmd>Telescope lsp_references<CR>")
keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
keymap("n", "<leader>r", "<cmd>Telescope registers<CR>")
keymap("n", "<leader>c", "<cmd>Telescope commands<CR>")
keymap("n", "<leader>h", "<cmd>Telescope builtin<CR>")
keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>")
keymap("n", "<leader>cpb", "<cmd>:let @+ = expand('%:p')<CR>")
keymap("n", "<leader>jq", "<cmd>:%!jq .<CR>") -- JQ format current buffer
keymap("n", "<leader>z", "<cmd>:tab split<CR>") -- z=zoom: full screen for a split buffer as tab
keymap("n", "<leader>zo", "<cmd>:tabc<CR>") -- zo=zoom-out: close full screen for a split buffer as tab

-- Terminal keymap
keymap("t", "<esc>", [[<C-\><C-n>]], opts)
