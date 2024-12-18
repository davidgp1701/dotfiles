{
  programs.nixvim.plugins.nvim-jdtls = {
    enable = true;
    cmd = [
      (lib.getExe pkgs.jdt-language-server)
      "-data" "$HOME/.local/jdtls"
    ];
  };
}
