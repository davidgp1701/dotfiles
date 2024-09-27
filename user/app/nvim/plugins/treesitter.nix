{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      settings = {
        auto_install = true;
        highlight = {
          enable = true;
        };
      };
    };

    treesitter-textobjects = {
      enable = true;
    };

    ts-autotag = {
      enable = true;
    };

    ts-comments = {
      enable = true;
    };
  };
}
