local telescope = require("telescope")
local themes = require("telescope.themes")

telescope.setup({
    extensions = {
        ["ui-select"] = {
            themes.get_dropdown({}),
        },
    },
    defaults = {
        cache_picker = true,
    },
    pickers = {
        lsp_references = {
            theme = "dropdown",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.8,
                height = 0.9,
                preview_height = 0.6, -- 70% of height for preview
                prompt_position = "bottom",
                preview_cutoff = 1, -- Always show preview
            },
            path_display = {
                "absolute",
            },
            show_line = false,
        },
        buffers = {
            theme = "dropdown",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.8,
                height = 0.9,
                preview_height = 0.6, -- 70% of height for preview
                prompt_position = "bottom",
                preview_cutoff = 1, -- Always show preview
            },
        },
    },
})
vim.api.nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })

telescope.load_extension("toggleterm")
telescope.load_extension("ui-select")
