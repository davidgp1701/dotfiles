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

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>l";
      action.__raw = ''
        function()
          require("lint").try_lint()
        end
      '';
      options.desc = "Trigger linting for current file";
    }
  ];
}
