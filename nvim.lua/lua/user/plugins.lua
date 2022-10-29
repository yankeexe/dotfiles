-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
 --if not status_ok then
-- return
-- end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Plugins
-- Info:
-- ft =  Run on these filetypes
-- run = Post clone instructions
-- cmd = lazy loading (run the extension only when you enter those commands)
return packer.startup(function(use)
  -- cmd = lazy load plugin, only run when `:MarkdownPreview` is run.
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd= 'MarkdownPreview'}

  -- Colorschemes
  use 'folke/tokyonight.nvim'
  use "morhetz/gruvbox"

  -- Completion plugins
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'

 -- Snippet Engine
 use 'L3MON4D3/LuaSnip'

-- LSP
use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
}
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-nvim-lua'

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {
  "nvim-treesitter/nvim-treesitter",
  run="<cmd>TSUpdate",
}

use "nvim-treesitter/playground"

use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}

use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
  },
}

use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}


use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}


use 'JoosepAlviste/nvim-ts-context-commentstring'
use "windwp/nvim-autopairs"
use "voldikss/vim-floaterm"
use {'mfussenegger/nvim-lint'}


  -- Default ones
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

end)
