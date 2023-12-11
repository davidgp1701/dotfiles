-- Terraform
local terraform = vim.api.nvim_create_augroup("Terraform", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.tfvars",
  },
  command = "set filetype=terraform",
  group = terraform,
})

local hcl = vim.api.nvim_create_augroup("HCL", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.hcl",
    ".terraformrc",
    "terraform.rc",
  },
  command = "set filetype=hcl",
  group = hcl,
})

-- local helm = vim.api.nvim_create_augroup("Helm", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = {
--     "*/templates/*.yaml",
--     "*/templates/*.tpl",
--     "*.gotmpl",
--     "helmfile*.yaml",
--   },
--   command = "set filetype=helm",
--   group = helm,
-- })
