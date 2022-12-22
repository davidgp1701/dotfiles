-- YAML
local yaml = vim.api.nvim_create_augroup("YAML", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.yamllint"
  },
  command = 'set filetype=yaml',
  group = yaml
})

-- Terraform
local terraform = vim.api.nvim_create_augroup("Terraform", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.tf",
    "*.tfvars",
  },
  command = 'set filetype=terraform',
  group = terraform
})

-- Autoformat on save
local autoFormatOnSave = vim.api.nvim_create_augroup("AutoFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.lua",
    "*.tf",
    "*.tfvars"
  },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
  group = autoFormatOnSave
})
