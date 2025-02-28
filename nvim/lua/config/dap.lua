return {
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        -- local dap_python = require("dap-python")

        require("dapui").setup()
        require("dap-go").setup()
        dap.configurations.go = {
            {
                type = "delve",
                name = "Debug",
                request = "launch",
                program = "${file}",
            },
        }
        -- dap_python.setup("python3")
        -- require("nvim-dap-virtual-text").setup({
        --     commented = true,
        -- })
        -- Toggle breakpoint
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- vim.fn.sign_define("DapBreakpoint", {
        --     text = "",
        --     texthl = "DiagnosticSignError",
        --     linehl = "",
        --     numhl = "",
        -- })
        --
        -- vim.fn.sign_define("DapBreakpointRejected", {
        --     text = "", -- or "❌"
        --     texthl = "DiagnosticSignError",
        --     linehl = "",
        --     numhl = "",
        -- })
        --
        -- vim.fn.sign_define("DapStopped", {
        --     text = "", -- or "→"
        --     texthl = "DiagnosticSignWarn",
        --     linehl = "Visual",
        --     numhl = "DiagnosticSignWarn",
        -- })
    end,
}
