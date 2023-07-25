vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.tf",
    "*.tfvars",
  },
  command = "set filetype=terraform",
  group = terraform,
})
