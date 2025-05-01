require("config.lazy")
require("lazy").setup("plugins")

require("core.keymaps")
require("core.options")
require("core.autocmds")

require("config.lsp")
require("config.cmp")
require("config.conform")
require("config.neotree")
require("config.treesitter")
-- require("config.dap")
require("config.lualine")
require("config.codecompanion")
-- require("config.ibl")
require("config.toggleterm")
require("config.telescope")
require("config.bufferline")
require("config.folding")
require("config.trouble")

-- Basic configurations
vim.cmd.colorscheme("catppuccin-mocha")

vim.cmd([[highlight SpecialKey ctermfg=lightgray guifg=#D3D3D3]])

--  Disabling virtual text is a requirement for tiny-inline-diagnostic
vim.diagnostic.config({ virtual_text = false })

-- Yanking config
vim.highlight.on_yank()
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
