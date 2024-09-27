{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Telescope grep_string<cr>";
      options.desc = "Find string under cursor in cwd";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Fuzzy find files in cwd";
    }
    {
      mode = "n";
      key = "<leader>fgc";
      action = "<cmd>Telescope git_commits<cr>";
      options.desc = "Find git commits for the project";
    }
    {
      mode = "n";
      key = "<leader>fgf";
      action = "<cmd>Telescope git_bcommits<cr>";
      options.desc = "Find git commits for actual buffer";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<cr>";
      options.desc = "Fuzzy find recent files";
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Find string in cwd";
    }
  ];
}
