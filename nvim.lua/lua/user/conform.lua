require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    go = { "gofmt" },
    json = { "jq" },
    yaml = { "yq" },
    ["*"] = { "codespell" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
  format_after_save = {
    lsp_fallback = true,
  },
})
