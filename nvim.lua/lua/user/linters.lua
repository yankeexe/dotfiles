local lint = require("lint")

lint.linters_by_ft = {
  python = {"mypy", "flake8"}
}

-- Run linter on save
vim.cmd [[
au BufWritePost * lua require('lint').try_lint()
]]


-- View error message when cursor reaches line containing the error
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
