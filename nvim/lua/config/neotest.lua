require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
            -- python = ".venv/bin/python",
            python = vim.fn.getcwd() .. "/.venv/bin/python",
            cwd = vim.fn.getcwd(),
        }),
    },
})
