require("conform").formatters.stylua = {
    inherit = false,
    command = "stylua",
    args = {
        "--stdin-filepath",
        "$FILENAME",
        "--indent-type=Spaces",
        "-",
    },
}

require("conform").setup({
    formatters_by_ft = {
        yaml = { "yq" },
        lua = { "stylua" },
        bash = { "shfmt" },
        -- Conform will run multiple formatters sequentially
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
