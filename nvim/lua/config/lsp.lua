-- :h lspconfig-all
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup({})

-- Python LSP configuration
vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
})

-- require("lspconfig").docker_compose_language_service.setup({})
-- require("lspconfig").dockerls.setup({})
-- require("lspconfig").gopls.setup({})
--
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
    vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
