-- nvim-treesitter `main` branch (Neovim 0.12+).
-- The old `require("nvim-treesitter.configs").setup({...})` API was removed on
-- this branch. Parsers are installed via `install()` and highlighting/indent
-- are enabled per-buffer through a FileType autocmd.

local nts = require("nvim-treesitter")

-- Parsers we always want installed (replaces `ensure_installed`).
local parsers = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "python",
  "javascript",
  "typescript",
  "cmake",
  "bash",
  "csv",
  "diff",
  "git_config",
  "gitignore",
  "go",
  "jq",
  "json",
}

-- Install/update the listed parsers (async; no-op when already up to date).
nts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable treesitter highlighting and indentation",
  callback = function(args)
    local buf = args.buf
    local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
    if not lang then
      return
    end

    -- `language.add` returns false (it does NOT error) when no parser is
    -- available, so we must check the boolean — not just whether it threw.
    -- Pseudo-filetypes like "neo-tree" land here and are skipped safely.
    local ok, added = pcall(vim.treesitter.language.add, lang)
    if not (ok and added) then
      -- Parser not available locally: fetch it if nvim-treesitter ships
      -- one (replaces `auto_install`), then bail. It'll highlight next time.
      if vim.list_contains(nts.get_available(), lang) then
        nts.install({ lang })
      end
      return
    end

    -- Highlighting (replaces `highlight = { enable = true }`).
    vim.treesitter.start(buf, lang)

    -- Indentation (replaces `indent = { enable = true }`); still experimental.
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
