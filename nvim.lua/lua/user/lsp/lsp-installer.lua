local lsp = require("lspconfig")
require("mason").setup()


local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls" }
})

lsp.pyright.setup { on_attach = on_attach, settings = {
  python = { analysis = { typeCheckingMode = "off", diagnosticMode = "openFilesOnly", useLibraryCodeForTypes = true } } } }

lsp.lua_ls.setup { on_attach = on_attach, settings = {
  Lua = { checkThirdParty = false, diagnostics = { globals = { "vim" } } }
} }

lsp.gopls.setup { on_attach = on_attach }

lsp.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "workflows.yaml"
      }
    }
  }
}

lsp.helm_ls.setup {}
