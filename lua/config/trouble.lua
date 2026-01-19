require("trouble").setup({
    modes = {
        symbols = { -- Configure symbols mode
            win = {
                type = "split", -- split window
                relative = "win", -- relative to current window
                position = "bottom", -- right side
                size = 0.6,
            },
        },
    },
})
