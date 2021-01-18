lua <<EOF 
  local lsp_status = require('lsp-status')
  local diagnostic = require('diagnostic')
  local completion = require('completion')
  local nvim_lsp = require('nvim_lsp')
  local configs = require('nvim_lsp/configs')
  local util = require('nvim_lsp/util')

  local on_attach = function(client, bufnr)
    lsp_status.on_attach(client, bufnr)
    diagnostic.on_attach(client, bufnr)
    completion.on_attach(client, bufnr)

    -- Keybindings for LSPs
    -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
    vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
  end

  lsp_status.register_progress()
  lsp_status.config({
    status_symbol = '',
    indicator_errors = 'e',
    indicator_warnings = 'w',
    indicator_info = 'i',
    indicator_hint = 'h',
    indicator_ok = 'ok',
  })

  -- Adding Terraform Language Server
  nvim_lsp.terraformls.setup({
    on_attach = on_attach,
    cmd = {'terraform-ls', 'serve'}
  })
<<EOF
