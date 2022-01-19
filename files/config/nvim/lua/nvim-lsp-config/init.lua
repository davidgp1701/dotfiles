local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("nvim-lsp-config.lsp-installer")
require("nvim-lsp-config.handlers").setup()

