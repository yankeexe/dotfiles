-- lazy vim start
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- lazy vim end

require("lazy").setup({
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	-- Colorschemes
	"folke/tokyonight.nvim",
	"morhetz/gruvbox",
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "rebelot/kanagawa.nvim" },
	-- ESSENTIALS
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-symbols.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = "<cmd>TSUpdate",
	},
	-- Completion plugins
	"hrsh7th/nvim-cmp", -- core engine for completion
	"hrsh7th/cmp-buffer", -- completion of words from the current buffer
	"hrsh7th/cmp-path", -- complete file paths
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp", -- works with snippets,
	"hrsh7th/cmp-nvim-lua", -- completion for neovim config using lua
	-- Snippet Engine
	"L3MON4D3/LuaSnip",
	-- LSP
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- "wbthomason/packer.nvim", -- Package manager
		"neovim/nvim-lspconfig",
	},
	{
		"romgrk/barbar.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	-- File Explorer side bar
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	},
	-- Popup terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	{
		"ryanmsnyder/toggleterm-manager.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
		},
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	"jose-elias-alvarez/null-ls.nvim",
	"windwp/nvim-autopairs",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- Git integrations
	{ "f-person/git-blame.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	"lukas-reineke/indent-blankline.nvim",
	-- Bookmarks
	{
		"otavioschwanck/arrow.nvim",
		config = function()
			require("arrow").setup({
				show_icons = true,
				leader_key = "qq", -- Recommended to be a single key
			})
		end,
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>so", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},
	-- {
	--   'stevearc/oil.nvim',
	--   opts = { default_file_explorer = true, },
	--   -- Optional dependencies
	--   dependencies = { "nvim-tree/nvim-web-devicons" },
	-- },
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{ "folke/neodev.nvim", opts = {} },
	{
		-- Auto formatter
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("which-key").setup()

			require("which-key").register({
				["<leader>s"] = { name = "Fuzzy find in current buffer", _ = "which_key_ignore" },
				["<leader>g"] = { name = "Lazy git", _ = "which_key_ignore" },
				["<leader>cpb"] = { name = "Copy current buffer full path", _ = "which_key_ignore" },
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "SmiteshP/nvim-navic", opts = {}, dependencies = { "neovim/nvim-lspconfig" } },
	{ "MunifTanjim/nui.nvim" },
	-- Diagnostics
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	{ "sindrets/diffview.nvim" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
      -- stylua: ignore
      keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
      },
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},

	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup(--[[optional config]])
		end,
	},

	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "llama3:8b", -- The default model to use.
			host = "localhost", -- The host running the Ollama service.
			port = "11434", -- The port on which the Ollama service is listening.
			quit_map = "q", -- set keymap for close the response window
			retry_map = "<c-r>", -- set keymap to re-send the current prompt
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = function(options)
				local body = { model = options.model, stream = true }
				return "curl --silent --no-buffer -X POST http://"
					.. options.host
					.. ":"
					.. options.port
					.. "/api/chat -d $body"
			end,
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a command string.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			-- list_models = '<omitted lua function>', -- Retrieves a list of model names
			display_mode = "split", -- The display mode. Can be "float" or "split".
			show_prompt = true, -- Shows the prompt submitted to Ollama.
			show_model = true, -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = false, -- Never closes the window automatically.
			debug = false, -- Prints errors and the command which is run.
		},
	},
	-- Default ones
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", --  ful lua functions  d by lots of plugins
	{
		"nvim-focus/focus.nvim",
		version = false,
		config = function()
			require("focus").setup()
		end,
	},
	{
		"piersolenski/telescope-import.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("import")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{ "nvim-telescope/telescope-ui-select.nvim" }, -- overrides menu items to telescope popup
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{ "mg979/vim-visual-multi" },
	{
		"axkirillov/easypick.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },
})
