-- use <space> key as the leader key.
vim.g.mapleader = " "

local keymap = vim.keymap.set
local function set_keymap(mode, lhs, rhs, description)
    local opts = { silent = true, noremap = true }
    if description then
        opts.desc = description
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- use <jk> as esc.
set_keymap("i", "jk", "<ESC>", "Normal Mode")

-- folding
set_keymap("n", "zR", require("ufo").openAllFolds, "Open all folds")
set_keymap("n", "zM", require("ufo").closeAllFolds, "Close all folds")

-- Buffer navigation
set_keymap("n", "<S-l>", ":bnext<CR>", "Buffer Next")
set_keymap("n", "<S-h>", ":bprevious<CR>", "Buffer Previous")
set_keymap("n", ";w", ":w<CR>", "Save buffer")

-- UndoTree
set_keymap("n", "<leader>ut", ":UndotreeToggle<cr>", "UndoTree Toggle")

set_keymap("n", "<ESC><ESC>", ":nohlsearch<Bar>:echo<CR>", "Remove highlights")
set_keymap("n", "<leader>e", ":Neotree reveal<CR>", "Neotree")

-- Pickers
set_keymap("n", "<leader><leader>", ":Telescope find_files<CR>", "Find files")
set_keymap("n", "<leader>m", ":Telescope marks<CR>", "Select Marks")
set_keymap("n", "<leader>b", ":Telescope buffers<CR>", "Select buffer")
set_keymap("n", "<leader>f", ":Telescope current_buffer_fuzzy_find<CR>", "Search in current buffer")
set_keymap("n", "<leader>F", ":Telescope live_grep<CR>", "Whole project search")
set_keymap("n", "<leader>h", ":Telescope help_tags<CR>", "Search Help tags")
set_keymap("n", ";T", ":Telescope toggleterm<CR>", "Search Help tags")

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")

-- Quickfix nav
set_keymap("n", "<C-n>", "<cmd>cnext<CR>", "Quickfix: cnext")
set_keymap("n", "<C-p>", "<cmd>cprev<CR>", "Quickfix: cprev")

-- Git
-- Lazygit
set_keymap("n", "<leader>lg", "<cmd>lua Snacks.lazygit.open()<cr>", "Lazygit")

set_keymap("n", "<leader>sp", "<cmd>lua Snacks.scratch.open()<cr>", "Scratchpad")
set_keymap("n", "<leader>sl", "<cmd>lua Snacks.scratch.list()<cr>", "Scratchpad list")
set_keymap("n", "<leader>j", "<cmd>lua Snacks.terminal.toggle()<cr>", "Terminal toggle")
set_keymap("n", "<leader>kk", "<cmd>lua Snacks.picker.keymaps()<cr>", "Show keymaps")
set_keymap(
    "n",
    "<leader>ss",
    "<cmd>lua Snacks.picker.lsp_symbols({layout = {preset = 'vscode', preview = 'main'}})<cr>",
    "LSP Symbols"
)

-- Neotest
set_keymap("n", "<leader>tt", ":lua require('neotest').summary.toggle()<CR>", "Neotest toggle")
set_keymap("n", "<leader>tr", ":lua require('neotest').run.run()<CR>", "Neotest run")
set_keymap("n", "<leader>to", ":  lua require('neotest').output_panel.toggle()<CR>", "Neotest output panel")
set_keymap("n", "<leader>toc", ":  lua require('neotest').output_panel.clear()<CR>", "Neotest clear output panel")

-- Code companion
set_keymap("n", "<leader>cc", ":CodeCompanionChat Toggle<cr>", "Toggle AI Chat window")
set_keymap("n", "<leader>ca", ":CodeCompanionActions<cr>", "AI Actions")
set_keymap("v", "<leader>ci", ":CodeCompanionChat Add<cr>", "Insert visually selected code to chat window")

-- Trouble.nvim
set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)")
set_keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)")
set_keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=true<cr>", "Symbols (Trouble)")
set_keymap("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "Trouble LSP toggle")
set_keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)")
set_keymap("n", ";q", "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)")

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

        vim.keymap.set("n", "K", "<cmd>Lspsaga peek_definition<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "<Leader>r", "<cmd>lua Snacks.picker.resume()<cr>", opts)
        vim.keymap.set(
            "n",
            "gr",
            "<cmd>Lspsaga finder<CR>",
            { desc = "Go to references", noremap = true, silent = true }
        )
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename Symbol", buffer = event.buf })
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        -- vim.keymap.set("n", "<leader>gc", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        vim.keymap.set("n", "<leader>gc", "<cmd>Lspsaga code_action<cr>", opts)
    end,
})
