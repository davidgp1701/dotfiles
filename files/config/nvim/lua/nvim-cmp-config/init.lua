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
    with_text = false,
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

  -- TODO Update this when having a snippet tool selected
  -- snippet = {
  --   expand = function(args)
  --     require("luasnip").lsp_expand(args.body)
  --   end,
  -- },

  formatting = {
    -- To show a nice formatting of the different sources for completion
    format = lspkind.cmp_format {
      with_text = true,
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

