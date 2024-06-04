local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({
	defaults = {
		layout_config = { width = 0.9 },
		file_ignore_patterns = { "node_modules", "venv", ".git", ".idea" },
		mappings = {
			i = {
				["<C-i>"] = "which_key",
				["<S-Down>"] = actions.cycle_history_next,
				["<S-Up>"] = actions.cycle_history_prev,
			},
		},
	},
	pickers = {
		current_buffer_fuzzy_find = {},
		find_files = {
			theme = "ivy",
			hidden = true,
			follow = true,
			mappings = {
				n = {
					["/"] = "select_vertical",
					["-"] = "select_horizontal",
				},
				i = {
					["<C-i>"] = "which_key",
					["<C-/>"] = false,
					["<C-->"] = false,
					["<S-Down>"] = actions.cycle_history_next,
					["<S-Up>"] = actions.cycle_history_prev,
				},
			},
		},
		diagnostics = { theme = "dropdown", layout_config = { width = 0.9, height = 0.3 } },
		buffers = { theme = "ivy", hidden = true },
		-- `live_grep` uses ripgrep, these are config for ripgrep
		live_grep = { additional_args = { "-F", "-L" } },
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

-- extension needs to be loaded after setup
telescope.load_extension("fzf")
