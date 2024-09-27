{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable =  true;

      settings ={
        format_on_save = {
          lspFallback = true;
          timeoutMs = 1000;
        };

        formatters_by_ft = {
          bash = [ "shfmt" ];
          css = [ "prettier" ];
          go = [ "gofmt" ];
          html = [ "prettier" ];
          # javascript = [ [ "prettierd" "prettier" ] ];
          json = [ "prettier" ];
          lua = [ "stylua" ];
          markdown = [ "prettier" ];
          python = [ "isort" "black" ];
          sh = [ "shfmt" ];
          terraform = [ "terraform_fmt" ];
          terraform-vars = [ "terraform_fmt" ];
          yaml = [ "yamlfmt" ];

          "*" = [ "codespell" ];
          "_" = [ "trim_whitespace" ];
        };
      };
    };
  };
}
