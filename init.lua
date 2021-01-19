local nvim_lsp = require 'lspconfig'

-- Terraform LSP configuraiton
nvim_lsp.terraformls.setup{
  cmd = {'terraform-ls', 'serve'}
}
