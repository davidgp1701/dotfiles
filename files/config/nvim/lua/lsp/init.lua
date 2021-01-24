local nvim_lsp = require 'lspconfig'
local completion = require 'completion'

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)

  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

-- Terraform LSP configuraiton
nvim_lsp.terraformls.setup{
  on_attach = on_attach,
  cmd = {'terraform-ls', 'serve'},
  root_dir = nvim_lsp.util.root_pattern(".terraform", ".git")
}
