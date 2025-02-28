local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

-- Get the toggleterm state
local toggleterm_state = require("toggleterm.terminal")

local M = {}

-- Function to get all toggleterm instances
local function get_terms()
    local terms = {}
    for _, term in ipairs(toggleterm_state.get_all()) do
        table.insert(terms, {
            id = term.id,
            name = term.name or ("Terminal " .. term.id),
            display = term.name and (term.name .. " (" .. term.id .. ")") or ("Terminal " .. term.id),
        })
    end
    return terms
end

-- Function to rename a terminal
local function rename_terminal(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    if selection then
        vim.ui.input({ prompt = "New name: " }, function(new_name)
            if new_name then
                local term = toggleterm_state.get(selection.value.id)
                if term then
                    term.name = new_name
                    actions.close(prompt_bufnr)
                    M.list_terms()
                end
            end
        end)
    end
end

function M.list_terms()
    local opts = {}
    pickers
        .new(opts, {
            prompt_title = "Toggleterm Windows",
            finder = finders.new_table({
                results = get_terms(),
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry.display,
                        ordinal = entry.display,
                    }
                end,
            }),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, map)
                -- Create new terminal with Ctrl+n
                map("i", "<C-n>", function()
                    actions.close(prompt_bufnr)
                    toggleterm_state.Terminal:new():toggle()
                    -- Reopen the picker after creating new terminal
                    vim.defer_fn(function()
                        M.list_terms()
                    end, 100)
                end)

                -- Delete terminal with 'd' in normal mode
                map("n", "d", function()
                    local selection = action_state.get_selected_entry()
                    if selection then
                        local term = toggleterm_state.get(selection.value.id)
                        if term then
                            term:shutdown()
                            actions.close(prompt_bufnr)
                            vim.notify(
                                "Toggleterm Terminal " .. selection.value.id .. " deleted",
                                vim.log.levels.INFO,
                                {
                                    timeout = 500,
                                }
                            )
                            M.list_terms()
                        end
                    end
                end)

                -- Rename terminal with 'r' in normal mode
                map("n", "r", function()
                    rename_terminal(prompt_bufnr)
                end)

                -- Select and toggle terminal
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    if selection then
                        actions.close(prompt_bufnr)
                        local term = toggleterm_state.get(selection.value.id)
                        if term then
                            term:toggle()
                        end
                    end
                end)
                return true
            end,
        })
        :find()
end

return require("telescope").register_extension({
    exports = {
        toggleterm = M.list_terms,
    },
})
