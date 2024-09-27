{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    # Nvim-Tree
    {
      mode = "n";
      key = "<leader>ee";
      action = "<cmd>NvimTreeToggle<CR>";
      options.desc = "Toggle file explorer";
    }
    {
      mode = "n";
      key = "<leader>ef";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      options.desc = "Toggle file explorer on current file";
    }
    {
      mode = "n";
      key = "<leader>ec";
      action = "<cmd>NvimTreeCollapse<CR>";
      options.desc = "Collapse file explorer";
    }
    {
      mode = "n";
      key = "<leader>er";
      action = "<cmd>NvimTreeRefresh<CR>";
      options.desc = "Refresh file explorer";
    }
  ];
}
