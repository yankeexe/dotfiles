-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "docker*.yaml", "docker-compose*.yaml" },
    callback = function()
        if vim.fn.expand("%:t"):match("docker%-compose%.yaml") then
            vim.bo.filetype = "yaml.docker-compose"
        end
    end,
})

-- Bind ESC on terminal to go to normal mode
vim.api.nvim_create_autocmd("TermEnter", {
    pattern = "*",
    callback = function()
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
    end,
})
