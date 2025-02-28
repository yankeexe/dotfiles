require("nvim-treesitter.configs").setup({
    indent = { enable = true },
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "python",
        "javascript",
        "typescript",
        "cmake",
        "bash",
        "csv",
        "diff",
        "git_config",
        "gitignore",
        "go",
        "jq",
        "json",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
