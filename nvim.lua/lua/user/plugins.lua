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


require("lazy").setup(
  {
    { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install', cmd = 'MarkdownPreview' },
    -- Colorschemes
    'folke/tokyonight.nvim',
    "morhetz/gruvbox",
    { "catppuccin/nvim",              as = "catppuccin" },
    { "rebelot/kanagawa.nvim" },
    -- ESSENTIALS
    { "nvim-tree/nvim-web-devicons" },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = "<cmd>TSUpdate",
    },
    -- Completion plugins
    'hrsh7th/nvim-cmp',     -- core engine for completion
    'hrsh7th/cmp-buffer',   -- completion of words from the current buffer
    'hrsh7th/cmp-path',     -- complete file paths
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp', -- works with snippets,
    'hrsh7th/cmp-nvim-lua', -- completion for neovim config using lua
    -- Snippet Engine
    'L3MON4D3/LuaSnip',
    -- LSP
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    {
      "williamboman/mason-lspconfig.nvim",
      -- "wbthomason/packer.nvim", -- Package manager
      "neovim/nvim-lspconfig",
    },
    {
      'romgrk/barbar.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },
    -- File Explorer side bar
    {
      'kyazdani42/nvim-tree.lua',
      dependencies = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
    },
    -- Popup terminal
    {
      "akinsho/toggleterm.nvim",
      version = '*',
      config = true
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
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },
    "jose-elias-alvarez/null-ls.nvim",
    "windwp/nvim-autopairs",
    {
      'simrat39/symbols-outline.nvim',
      config = function()
        require("symbols-outline").setup()
      end
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- Git integrations
    { 'f-person/git-blame.nvim' },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    },
    "lukas-reineke/indent-blankline.nvim",
    -- Bookmarks
    {
      'otavioschwanck/arrow.nvim',
      config = function()
        require('arrow').setup({
          show_icons = true,
          leader_key = 'qq' -- Recommended to be a single key
        })
      end
    },
    {
      'stevearc/oil.nvim',
      opts = { default_file_explorer = true, },
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "j-hui/fidget.nvim",
      opts = {
        -- options
      },
    },
    { "folke/neodev.nvim",   opts = {} },
    {
      -- Auto formatter
      'stevearc/conform.nvim',
      opts = {},
    },
    {
      'folke/which-key.nvim',
      event = 'VeryLazy',
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      config = function()
        require('which-key').setup()

        require('which-key').register {
          ['<leader>s'] = { name = 'Fuzzy find in current buffer', _ = 'which_key_ignore' },
          ['<leader>g'] = { name = 'Lazy git', _ = 'which_key_ignore' },
        }
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
      ---@type Flash.Config
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
    -- Default ones
    "nvim-lua/popup.nvim",   -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", --  ful lua functions  d by lots of plugins
  })
