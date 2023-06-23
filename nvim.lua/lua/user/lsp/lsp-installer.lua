require("mason").setup()


require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls" }
})

require("lspconfig").pyright.setup { settings = { python = { analysis = { typeCheckingMode = "off" } } } }
require("lspconfig").lua_ls.setup { settings = { Lua = { diagnostics = { globals = { "vim" } } } } }
require("lspconfig").gopls.setup {}



-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.setup(
-- 	{
-- 		on_attach = require("user.lsp.handlers").on_attach,
-- 		capabilities = require("user.lsp.handlers").capabilities,
-- 	}

-- 	 if server.name == "jsonls" then
-- 	 	local jsonls_opts = require("user.lsp.settings.jsonls")
-- 	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	 end

-- 	 if server.name == "sumneko_lua" then
-- 	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
-- 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	 end

-- 	 if server.name == "pyright" then
-- 	 	local pyright_opts = require("user.lsp.settings.pyright")
-- 	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	 end

-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)
