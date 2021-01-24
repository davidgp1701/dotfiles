local nvim_lsp = require 'lspconfig'
local completion = require 'completion'

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
end

-- Terraform LSP configuraiton
nvim_lsp.terraformls.setup{
  on_attach = on_attach,
  cmd = {'terraform-ls', 'serve'},
  root_dir = nvim_lsp.util.root_pattern(".terraform", ".git")
}
