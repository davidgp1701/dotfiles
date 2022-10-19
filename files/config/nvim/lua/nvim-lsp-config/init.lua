-- Complextras.nvim configuration
vim.api.nvim_set_keymap(
  "i",
  "<C-x><C-m>",
  [[<c-r>=luaeval("require('complextras').complete_matching_line()")<CR>]],
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<C-x><C-d>",
  [[<c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]],
  { noremap = true }
)

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
   return
end
lspkind.init({
    mode = 'text_symbol',

    symbol_map = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Variable = '[]',
      Class = '  ',
      Interface = ' 蘒',
      Module = '  ',
      Property = '  ',
      Unit = ' 塞 ',
      Value = '  ',
      Enum = ' 練',
      Keyword = '  ',
      Snippet = '  ',
      Color = '',
      File = '',
      Folder = ' ﱮ ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  '
    },
})

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.setup {
  mapping = {
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
    end,
  },

  -- Order of the sources matter. First one has priority.
  -- you can configure:
  --   keywords_length
  --   priority
  --   max_item_count
  --   ...
  sources = {
    { name = "nvim_lua" }, -- Autoenables only for lua files
    { name = "zsh", keyword_length = 4 },
    { name = "nvim_lsp" },
    { name = "path" },
    -- { name = "luasnip" }, -- TODO enable when playing with snippets
    { name = "buffer", keyword_length = 5 }, -- Only try to replace with buffer matching words if typed at least 5 chars
    { name = "neorg" }
  },

  sorting = {
    compators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,


      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  snippet = {
     expand = function(args)
       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
     end,
  },

  formatting = {
    -- To show a nice formatting of the different sources for completion
    format = lspkind.cmp_format {
      mode = 'text_symbol',
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        zsh = "[zsh]",
        -- luasnip = "[snip]"
      },
    },
  },

  experimental = {
    -- Test the new menu
    native_menu = false,

    -- Make text to fade a bit
    ghost_text = false,
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

-- nmap{"C-f", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>"}
local on_attach = function(client, bufnr)

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- leaving only what I actually use...
	-- buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	-- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	-- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	-- buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	if client.server_capabilities.document_formatting then
		vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]])
	end

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
	end
end

lsp_installer.setup{}

local lspconfig = require('lspconfig')

lspconfig.bashls.setup{
  capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.pylsp.setup{
  capabilities = capabilities,
	on_attach = on_attach,

}

lspconfig.terraformls.setup{
  capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
	on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
