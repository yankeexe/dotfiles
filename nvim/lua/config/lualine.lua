require("lualine").setup({
    sections = {
        lualine_b = { "tabs" },
        lualine_c = {
            {
                "filename",
                path = 1,
            },
        },
    },
})
