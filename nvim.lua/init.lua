require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.completions"
require "user.lsp"
require "user.treesitter"
require "user.nvim-tree"
require "user.toggleterm"
require "user.telescope"
require "user.comment"
require "user.linters"
require "user.null-ls"
require "user.lualine"
require "user.indent-blankline"


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true, timeout = 3000 }
    end, opts)
  end,
})

-- Disable inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end


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
