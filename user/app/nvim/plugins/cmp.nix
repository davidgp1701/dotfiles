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
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "luasnip"; }
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
