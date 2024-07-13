local lsp = require("lspconfig")
require("mason").setup()

local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

require("mason-lspconfig").setup({
	ensure_installed = { "basedpyright", "lua_ls" },
})

lsp.basedpyright.setup({
	on_attach = on_attach,
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
			},
		},
	},
})

lsp.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = { checkThirdParty = false, diagnostics = { globals = { "vim" } } },
	},
})

lsp.gopls.setup({ on_attach = on_attach })

lsp.yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "workflows.yaml",
			},
		},
	},
})

lsp.helm_ls.setup({})
lsp.terraformls.setup({})
lsp.tflint.setup({})
