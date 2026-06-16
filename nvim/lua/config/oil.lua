require("oil").setup()

vim.api.nvim_create_user_command('OilToggle', function()
  if vim.bo.filetype == 'oil' then
    vim.cmd('bd')
  else
    require("oil").open_float()
  end
end, { nargs = 0 })
