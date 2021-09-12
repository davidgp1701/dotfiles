local nvim_lsp = require 'lspconfig'

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- Bash LS configuration
nvim_lsp.bashls.setup{}

-- Python LS configuration
nvim_lsp.pylsp.setup{}

-- Terraform LSP configuraiton
nvim_lsp.terraformls.setup{}
