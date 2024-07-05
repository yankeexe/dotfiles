local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.black,
		formatting.isort,
		formatting.prettier,
		formatting.beautysh,
		formatting.shfmt,
		formatting.fixjson,
		formatting.jq,
		formatting.hclfmt,
		formatting.pg_format,
		formatting.terraform_fmt,
	},
})
