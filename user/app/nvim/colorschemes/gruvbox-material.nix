{ pkgs,...}:

{
  programs.nixvim.extraPlugins = [
    ( pkgs.vimUtils.buildVimPlugin {
      name = "gruvbox-material";
      src = pkgs.fetchFromGitHub {
          owner = "sainnhe";
          repo = "gruvbox-material";
          rev = "30e9f4b0fa24c25980df1690a8c47c36e40b6673";
          hash = "sha256-qxblRazEDaVUPJI7xmqLE7ovTMbFVn57/XCy7WaW+Vs=";
        };
    })
  ];

  programs.nixvim.extraConfigLua = /* lua */ ''
    vim.cmd[[let g:gruvbox_material_background='medium']]
    vim.cmd[[let g:gruvbox_material_foreground='mix']]
    vim.cmd[[colorscheme gruvbox-material]]
  '';
}
