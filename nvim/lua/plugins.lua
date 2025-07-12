return {
    -- Git plugins
    -- { "github/copilot.vim" },
    { "sindrets/diffview.nvim", event = "VeryLazy" },
    { "tpope/vim-fugitive" },
    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        opts = {
            enabled = true,
            message_template = " <author> • <summary> • <date>", -- template for the blame message, check the Message template section for more options
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
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local path = "/Users/yankeemaharjan/.venvs/nvim/bin/python"
            require("dap-python").setup(path)
        end,
    },
    {
        "wurli/contextindent.nvim",
        -- This is the only config option; you can use it to restrict the files
        -- which this plugin will affect (see :help autocommand-pattern).
        opts = { pattern = "*" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    { "mbbill/undotree" },
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
        event = "VeryLazy",
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        event = "VeryLazy",
    },
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
    { "akinsho/toggleterm.nvim", version = "*", config = true, event = "VeryLazy" },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
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
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    {
        "olimorris/codecompanion.nvim",
        config = true,
        event = "VeryLazy",
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
            animate = {},
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
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
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
        event = "VeryLazy",
    },
    -- LSP Plugins
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
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
