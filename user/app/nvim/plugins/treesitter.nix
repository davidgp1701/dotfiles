{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "css"
          "html"
          "javascript"
          "json"
          "lua"
          "markdown"
          "markdown_inline"
          "python"
          "regex"
          "rust"
          "toml"
          "tsx"
          "typescript"
          "vimdoc"
          "yaml"
          "nix"
          "vim"
        ];
        nixvimInjections = true;
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
