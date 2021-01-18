local nvim_lsp = require('nvim_lsp')

-- Adding Terraform Language Server
nvim_lsp.terraformls.setup({
  cmd = {'terraform-ls', 'serve'}
})
