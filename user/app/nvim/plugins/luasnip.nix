{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;

      settings = {
        history = true;
        delete_check_events = "TextChanged";
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = [ "i" "s" ];
      key  = "<C-L>";
      action.__raw = ''
        function()
          require("luasnip").jump(1)
        end
      '';
    }
    {
      mode = [ "i" "s" ];
      key  = "<C-J>";
      action.__raw = ''
        function()
          require("luasnip").jump(-1)
        end
      '';
    }
  ];
}
