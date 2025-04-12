{ lib, pkgs,... }:
{
  programs.nixvim.plugins.jdtls  = {
    enable = true;
    settings.cmd = [
      (lib.getExe pkgs.jdt-language-server)
      "-data" "$HOME/.local/jdtls"
    ];
  };
}
