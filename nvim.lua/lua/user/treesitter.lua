local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    -- the enabled option should be true but when saving dokcerifle it's causing issues
    enable = true,    -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
    auto_install = true

  },
  indent = { enable = true, disable = { "yaml", "python" } },
  context_commentstring = {
    enable = true }
}
