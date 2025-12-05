-- :h lspconfig-all

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "gopls", "basedpyright", "zls" },
})

vim.lsp.config("lua_ls", { library = {
    vim.api.nvim_get_runtime_file("", true),
} })

-- Python LSP configuration
vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic",
                exclude = { ".venv", "venv" },
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
})

-- require("lspconfig").docker_compose_language_service.setup({})
-- require("lspconfig").dockerls.setup({})
-- vim.lsp.config("gopls", {})
--
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
-- Configure default capabilities for LSP
vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require("lspsaga").setup({
    symbol_in_winbar = {
        folder_level = 0,
        show_file = false,
    },
    diagnostic = {
        max_height = 0.8,
        keys = {
            quit = { "q", "<ESC>" },
        },
    },
})
