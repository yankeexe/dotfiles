require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.treesitter"
require "user.nvim-tree"
require "user.toggleterm"
require "user.telescope"
require "user.comment"

-- Native LSP setup for Go
-- require "lsp.config".gopls.setup{
--   on_attach = function()
--     print("Golang keymaps loaded")
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- pop up info card
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- go to definition
--     vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- go to type
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- go to implementation
--     vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0}) -- move forward to error in file
--     vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0}) -- move back to error in file
--     vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}) -- rename variable and its instances

--     -- Show auto fix options for errors under the cursor
--     vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, {buffer=0})


--     -- list diagnostic :: <cmd> = : (colon)
--     vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostic<cr>", {buffer=0})

--   end
-- }
