local M = {}

-- Table to track the last used picker for each command
M.command_history = {}

-- The main smart telescope function
M.smart_telescope = function(telescope_func, opts)
    opts = opts or {}
    local builtin = require("telescope.builtin")

    -- Get a unique key for this command
    local cmd_key = type(telescope_func) == "string" and telescope_func or tostring(telescope_func)

    -- Check if we have a history for this command
    if M.command_history[cmd_key] then
        -- Try to resume this specific command
        local success = pcall(function()
            builtin.resume({ picker_index = M.command_history[cmd_key] })
        end)

        -- If resume failed, run the command fresh
        if not success then
            M.run_fresh(telescope_func, opts, cmd_key)
        end
    else
        -- First time running this command
        M.run_fresh(telescope_func, opts, cmd_key)
    end
end

-- Helper function to run a fresh telescope command
M.run_fresh = function(telescope_func, opts, cmd_key)
    local builtin = require("telescope.builtin")

    -- Run the telescope command
    if type(telescope_func) == "string" then
        -- Run the command
        builtin[telescope_func](opts)

        -- Store the picker index for future resume
        -- The new picker should be at index 1 (most recent)
        M.command_history[cmd_key] = 1
    else
        -- For function references, just call the function
        telescope_func(opts)
        M.command_history[cmd_key] = 1
    end
end

return M
