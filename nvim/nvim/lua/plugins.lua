local sections = require("lazy.view.sections")
return {
    -- Git plugins
    { "sindrets/diffview.nvim" },

    { "tpope/vim-fugitive" },
    {
        "f-person/git-blame.nvim",
        -- load the plugin at startup
        event = "VeryLazy",
        -- Because of the keys part, you will be lazy loading this plugin.
        -- The plugin wil only load once one of the keys is used.
        -- If you want to load the plugin at startup, add something like event = "VeryLazy",
        -- or lazy = false. One of both options will work.
        opts = {
            -- your configuration comes here
            -- for example
            enabled = true, -- if you want to enable the plugin
            message_template = " <author> • <summary> • <date> • <<sha>>", -- template for the blame message, check the Message template section for more options
            date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
            virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
        },
    },
    -- nvim DAP
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go",
        },
    },
    {
        "wurli/contextindent.nvim",
        -- This is the only config option; you can use it to restrict the files
        -- which this plugin will affect (see :help autocommand-pattern).
        opts = { pattern = "*" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    "mbbill/undotree",
    { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
    },
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { preset = "modern" },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     ---@module "ibl"
    --     ---@type ibl.config
    --     opts = {},
    -- },
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    {
        "olimorris/codecompanion.nvim",
        config = true,
    },
    {
        "folke/edgy.nvim",
        ---@module 'edgy'
        ---@param opts Edgy.Config
        opts = function(_, opts)
            for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
                opts[pos] = opts[pos] or {}
                table.insert(opts[pos], {
                    ft = "snacks_terminal",
                    size = { height = 0.4 },
                    title = "%{b:snacks_terminal.id}: %{b:term_title}",
                    filter = function(_buf, win)
                        return vim.w[win].snacks_win
                            and vim.w[win].snacks_win.position == pos
                            and vim.w[win].snacks_win.relative == "editor"
                            and not vim.w[win].trouble_preview
                    end,
                })
            end
        end,
    },
    {
        "folke/snacks.nvim",
        opts = {
            lazygit = {},
            scratch = {},
            terminal = {},
            input = {},
            dim = {},
            quickfile = {},
            scroll = {},
            indent = {
                hl = {
                    "SnacksIndent1",
                    "SnacksIndent2",
                    "SnacksIndent3",
                    "SnacksIndent4",
                    "SnacksIndent5",
                    "SnacksIndent6",
                    "SnacksIndent7",
                    "SnacksIndent8",
                },
            },
            dashboard = {
                preset = { header = [[BUILD]] },
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 2 },
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
                },
            },
        },
    },
    "nvim-treesitter/nvim-treesitter",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- LSP Plugins
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/nvim-cmp",

            "hrsh7th/cmp-path",
            {
                "stevearc/conform.nvim",
                opts = {},
            },
        },
    },
}
