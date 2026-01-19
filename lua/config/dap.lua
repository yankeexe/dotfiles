return {
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Setup DAP UI first
        dapui.setup({
            -- You can customize the UI layout here if needed
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.25 },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks", size = 0.25 },
                        { id = "watches", size = 0.25 },
                    },
                    position = "left",
                    size = 40,
                },
                {
                    elements = {
                        { id = "repl", size = 0.5 },
                        { id = "console", size = 0.5 },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
        })

        -- Define the Python path
        local python_path = "/Users/yankeemaharjan/.venvs/nvim/bin/python"

        -- Validate Python path and debugpy installation
        if vim.fn.executable(python_path) == 0 then
            vim.notify("Invalid Python path: " .. python_path, vim.log.levels.ERROR)
            return
        end

        -- Check if debugpy is installed
        local debugpy_check = vim.fn.system(python_path .. " -m pip show debugpy")
        if not debugpy_check:match("Name: debugpy") then
            vim.notify("debugpy not found in the specified Python environment.", vim.log.levels.ERROR)
            return
        end

        -- Setup dap-python (handles adapter and configurations)
        require("dap-python").setup(python_path, {
            -- Optional: Explicitly set the adapter if needed
            adapter = {
                type = "executable",
                command = python_path,
                args = { "-m", "debugpy.adapter" },
            },
        })
        require("dap-python").test_runner = "pytest"
        require("dap-go").setup({})

        -- Define launch configurations (no need to redefine the adapter)
        dap.configurations.python = {
            {
                type = "python", -- Must match the adapter name
                request = "launch",
                name = "Debug Python File",
                program = "${file}",
                pythonPath = python_path,
                justMyCode = false,
                console = "integratedTerminal",
                cwd = "${workspaceFolder}",
            },
        }

        -- Integrate UI with DAP events
        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- Add keymaps for manually toggling the UI
        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })
    end,
}
