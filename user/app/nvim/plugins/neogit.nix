{
  programs.nixvim.plugins = {
    neogit = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Neogit<CR>";
      options.desc = "Opens Neogit";
    }
  ];
}
