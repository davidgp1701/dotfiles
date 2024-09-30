{
  programs.nixvim.plugins = {
    harpoon = {
      enable = true;
      enableTelescope = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ha";
      action.__raw = ''
        function()
          require("harpoon.mark").add_file()
        end
      '';
      options.desc = "Adds file to Harpoon";
    }
    {
      mode = "n";
      key = "<leader>hn";
      action.__raw = ''
        function()
          require("harpoon.ui").nav_next()
        end
      '';
      options.desc = "Go to next harpoon mark";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action.__raw = ''
        function()
          require("harpoon.ui").nav_prev()
        end
      '';
      options.desc = "Go to previus harpoon mark";
    }
    {
      mode = "n";
      key = "<leader>hu";
      action.__raw = ''
        function()
          require("harpoon.ui").toggle_quick_menu()
        end
      '';
      options.desc = "Show Harpoon file selector";
    }
  ];
}
