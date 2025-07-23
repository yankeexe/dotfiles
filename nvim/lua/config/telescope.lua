local telescope = require("telescope")
local themes = require("telescope.themes")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        cache_picker = true,

        theme = "dropdown",
        layout_strategy = "horizontal",
        -- layout_config = { -- this config is only applicable for vertical layout_strategy
        --     width = 0.8,
        --     height = 0.9,
        --     preview_height = 0.5, -- 70% of height for preview
        --     prompt_position = "bottom",
        --     preview_cutoff = 1, -- Always show preview
        -- },
        path_display = { "absolute" },
        show_line = false,
        mappings = {
            i = {
                ["<c-d>"] = actions.delete_buffer,
            },
            n = {
                ["<c-d>"] = actions.delete_buffer,
                ["dd"] = actions.delete_buffer,
            },
        },
    },

    extensions = {
        ["ui-select"] = {
            themes.get_dropdown({}),
        },
    },

    pickers = {},
})

telescope.load_extension("toggleterm")
telescope.load_extension("ui-select")
