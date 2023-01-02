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


local hcl = vim.api.nvim_create_augroup("HCL", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.hcl",
    ".terraformrc",
    "terraform.rc"
  },
  command = 'set filetype=hcl',
  group = hcl
})

local tfstate = vim.api.nvim_create_augroup("TFSTATE", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.tfstate",
    "*.tfstate.backup",
  },
  command = 'set filetype=json',
  group = tfstate
})

-- Autoformat on save
-- local autoFormatOnSave = vim.api.nvim_create_augroup("AutoFormatOnSave", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "BufWritePre", "BufWriteCmd" }, {
--   pattern = {
--     "*.lua",
--     "*.tf",
--     "*.tfvars"
--   },
--   command = 'LspZeroFormat',
--   group = autoFormatOnSave
-- })
