local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'bashls',
  'dockerls',
  'ltex',
  'lua_ls',
  'pylsp',
  'terraformls',
  'tflint',
  'yamlls'
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

-- Local ltex spell directory configuration
local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end

lsp.configure('ltex', {
  settings = {
    ltex = {
      dictionary = {
        ['en-US'] = words,
        ['en-GB'] = words,
      }
    }
  }
})

-- CMP configuration
local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-e>"] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-y>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  },
  ["<C-q>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  ["<C-space>"] = cmp.mapping.complete(),

  ["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end,
  ["S-<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})


lsp.on_attach(function(client, bufnr)

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, remap = false, desc = "Go to definition" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, remap = false, desc = "Show description in hover" })
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {
    buffer = bufnr,
    remap = false,
    desc = "Lists all LSP symbols in current workspace in the quickfix window" })
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {
    buffer = bufnr,
    remap = false,
    desc = "Show diagnostics in a floating Window" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {
    buffer = bufnr,
    remap = false,
    desc = "Go to next LSP diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {
    buffer = bufnr,
    remap = false,
    desc = "Go to previous diagnostics" })
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {
    buffer = bufnr,
    remap = false,
    desc = "Show possible code actions in the actual position" })
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {
    buffer = bufnr,
    remap = false,
    desc = "Show all references to the symbol under the cursor in the quickfix window" })
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {
    buffer = bufnr,
    remap = false,
    desc = "Rename symbol under the cursor" })
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {
    buffer = bufnr,
    remap = false,
    desc = "Displays the signature information of the symbol under the cursor in a floating window" })

  if client.server_capabilities.document_formatting then
    vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]] )
  end

  if client.name == "yamlls" then
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable(bufnr)
      vim.defer_fn(function()
        vim.diagnostic.reset(nil, bufnr)
      end, 1000)
    end
  end
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})

vim.keymap.set("n", "<leader>=", function()
  vim.lsp.buf.format()
end)
