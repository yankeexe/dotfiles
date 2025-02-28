local telescope = require("telescope")

telescope.setup({
    defaults = {
        cache_picker = true,
    },
})

telescope.load_extension("toggleterm")
