local telescope = require("telescope")


telescope.setup {
  defaults = {
    layout_config = { width = 0.9 },
    file_ignore_patterns = { "node_modules", "venv", ".git", ".idea" },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-i>"] = "which_key",
        ["<S-Down>"] = require('telescope.actions').cycle_history_next,
        ["<S-Up>"] = require('telescope.actions').cycle_history_prev,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = { theme = "ivy", hidden = true },
    diagnostics = { theme = "dropdown", layout_config = { width = 0.9, height = 0.3 } },
    buffers = { theme = "ivy", hidden = true },
    -- `live_grep` uses ripgrep, these are config for ripgrep
    live_grep = { additional_args = { "-F" } }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    }
  }
}

-- extension needs to be loaded after setup
telescope.load_extension('fzf')




-- CONFIGS FOR BUILTINS
