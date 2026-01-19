-- Auto-save after 2 seconds of inactivity in normal mode
local auto_save_timer = nil
local auto_save_interval = 2000 -- 2 seconds in milliseconds

-- Create an autocommand group for our auto-save functionality
vim.api.nvim_create_augroup("AutoSave", { clear = true })

-- Function to perform the save operation
local function perform_save()
    -- Only save if in normal mode and buffer is modifiable and modified
    if vim.fn.mode() == "n" and vim.bo.modifiable and vim.bo.modified then
        vim.cmd("silent! write")
        -- Optional: provide feedback that the file was saved
        -- vim.notify('File auto-saved', vim.log.levels.INFO)
    end
end

-- Setup autocommands to track activity and handle auto-saving
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = "AutoSave",
    callback = function()
        -- Only trigger auto-save if in normal mode
        if vim.fn.mode() == "n" then
            perform_save()
        end
    end,
})

-- Set the updatetime (time of no activity before CursorHold is triggered)
vim.opt.updatetime = auto_save_interval

--- Format on save ---
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

-- Disable automatic comment continuation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "r", "o" })
    end,
})

-- Set space indentation settings for YAML files
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "yaml",
    callback = function()
        vim.bo.expandtab = true -- Convert tabs to spaces
        vim.bo.shiftwidth = 2 -- Number of spaces for each indent
        vim.bo.softtabstop = 2 -- Number of spaces tabs count for
        vim.bo.tabstop = 2 -- Number of spaces for a tab
    end,
})
