{ config, pkgs,...}:

{
  programs.nixvim = {
    enable = true;

    # Color scheme
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.flavour = "mocha";

    # plugins
    plugins.lualine = {
      enable = true;
    };
  };
}
