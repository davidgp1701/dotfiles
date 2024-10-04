{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;

      settings = {
        completion = {
          completopt = "menu,menuone,preview,noselect";
        };

        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
          "<C-Space>" = ''
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }
          '';
          "<Tab>" = ''
             cmp.mapping(function(fallback)
               local status_ok, luasnip = pcall(require, "luasnip")

               if cmp.visible() then
                 cmp.select_next_item()
               elseif status_ok and luasnip.locally_jumpable(1) then
                 luasnip.jump(1)
               else
                 fallback()
               end
             end, { "i", "s" })
          '';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              local status_ok, luasnip = pcall(require, "luasnip")
              if cmp.visible() then
                cmp.select_prev_item()
              elseif status_ok and luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
        };

        sources = [
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };

    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
  };
}
