print("Loading toggleterm extension")

require("toggleterm").setup({
    shell = "/bin/zsh",
    open_mapping = [[;t]],
    direction = "float",
    float_opts = {
        border = "double",
        winblend = 3,
        title_pos = "center",
    },
})
