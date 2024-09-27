{
  programs.nixvim.plugins = {
    lint = {
      enable = true;

      lintersByFt = {
        ansible = ["ansible_lint"];
        json = ["jsonlint"];
        markdown = ["markdownlint"];
        python = ["pylint"];
        yaml = ["yamllint"];
        terraform = ["tfsec"];
      };
    };
  };
}
