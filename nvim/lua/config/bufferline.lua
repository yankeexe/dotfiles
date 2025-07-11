vim.opt.termguicolors = true

require("bufferline").setup({
    options = {

        truncate_names = false,
    },
    highlights = {
        buffer_selected = {
            fg = "#ffffff",
            -- bg = "#1e90ff",
            bold = true,
        },
        buffer_visible = {
            fg = "#d0d0d0",
            bg = "#3c3c3c",
        },
    },
})
