{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        ansiblels.enable = true;
        bashls.enable  = true;
        dockerls.enable = true;
        gopls.enable = true;
        helm_ls.enable = true;
        html.enable = true;
        jdtls.enable = true;
        nixd.enable = true;
        terraformls.enable = true;
        tflint.enable = true;
        yamlls.enable = true;
      };
    };

    lspkind = {
      enable = true;
    };
  };
}