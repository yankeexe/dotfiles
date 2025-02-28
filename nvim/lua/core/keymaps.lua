-- use <space> key as the leader key.
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- use <jk> as esc.
keymap("i", "jk", "<ESC>")

-- folding
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Buffer Next" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Buffer Previous" })

-- UndoTree
keymap("n", "<leader>ut", ":UndotreeToggle<cr>", { desc = "UndoTree Toggle" })

keymap("n", "<ESC><ESC>", ":nohlsearch<Bar>:echo<CR>", { desc = "Remove highlights" })

keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Neotree" })

-- Telescope mappings
local telescope_smart = require("config.telescope_resume").smart_telescope

keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Neotree" })
keymap("n", "<leader><leader>", function()
    telescope_smart("fd")
end, { desc = "Find files" })
keymap("n", "<leader>b", function()
    telescope_smart("buffers")
end, { desc = "Select buffer" })
keymap("n", "<leader>f", function()
    telescope_smart("current_buffer_fuzzy_find")
end, { desc = "Search in current buffer" })
keymap("n", "<leader>F", function()
    telescope_smart("live_grep")
end, { desc = "Whole project search" })
keymap("n", "<leader>h", function()
    telescope_smart("help_tags")
end, { desc = "Search Help tags" })
keymap("n", ";T", function()
    telescope_smart("toggleterm")
end, { desc = "Search terminals" })

-- keymap("n", "<leader><leader>", ":Telescope fd<CR>", { desc = "Find files" })
-- keymap("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Select buffer" })
-- keymap("n", "<leader>f", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in current buffer" })
-- keymap("n", "<leader>F", ":Telescope live_grep<CR>", { desc = "Whole project search" })
-- keymap("n", "<leader>h", ":Telescope help_tags<CR>", { desc = "Search Help tags" })
-- keymap("n", ";T", ":Telescope toggleterm<CR>", { desc = "Search Help tags" })

-- Window Navigation
-- keymap("n", "<C-h>", "<C-w>h")
-- keymap("n", "<C-l>", "<C-w>l")
-- keymap("n", "<C-j>", "<C-w>j")
-- keymap("n", "<C-k>", "<C-w>k")

-- Git
-- Lazygit
keymap("n", "<leader>lg", "<cmd>lua Snacks.lazygit.open()<cr>", { desc = "Lazygit" })

keymap("n", "<leader>sp", "<cmd>lua Snacks.scratch.open()<cr>", { desc = "Scratchpad" })
keymap("n", "<leader>sl", "<cmd>lua Snacks.scratch.list()<cr>", { desc = "Scratchpad list" })
keymap("n", "<leader>j", "<cmd>lua Snacks.terminal.toggle()<cr>", { desc = "Terminal toggle" })
keymap("n", "<leader>kk", "<cmd>lua Snacks.picker.keymaps()<cr>", { desc = "Terminal toggle" })
keymap(
    "n",
    "<leader>ss",
    "<cmd>lua Snacks.picker.lsp_symbols({layout = {preset = 'vscode', preview = 'main'}})<cr>",
    { desc = "LSP Symbols" }
)

-- Code companion
keymap("n", "<leader>cc", ":CodeCompanionChat Toggle<cr>", { desc = "Toggle AI Chat window" })
keymap("n", "<leader>ca", ":CodeCompanionActions<cr>", { desc = "AI Actions" })
keymap("v", "<leader>ci", ":CodeCompanionChat Add<cr>", { desc = "Insert visually selected code to chat window" })

-- Trouble.nvim
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=true<cr>", { desc = "Symbols (Trouble)" })
keymap(
    "n",
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)" }
)
keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- DAP keymap
local dap = require("dap")
keymap("n", "<leader>db", function()
    dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

-- Continue / Start
keymap("n", "<leader>dc", function()
    dap.continue()
end, { desc = "Debugger continue" })

-- Step Over
keymap("n", "<leader>do", function()
    dap.step_over()
end, { desc = "Deubber Step Over" })

-- Step Into
keymap("n", "<leader>di", function()
    dap.step_into()
end, { desc = "Debugger Step Into" })

-- Step Out
keymap("n", "<leader>dO", function()
    dap.step_out()
end, { desc = "Deubgger Step Out" })

-- Keymap to terminate debugging
keymap("n", "<leader>dq", function()
    require("dap").terminate()
end, { desc = "Debugger Quit" })

-- LSP Keymap Configuration
-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<leader>gc", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end,
})
