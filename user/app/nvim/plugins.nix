{ config, pkgs,...}:

{
  programs.nixvim.plugins = {
    comment = {
      enable = true;
    };

    conform-nvim = {
      enable =  true;

      formatOnSave = {
        lspFallback = true;
        timeoutMs = 1000;
      };

      formattersByFt = {
        bash = [ "shfmt" ];
        css = [ "prettier" ];
        go = [ "gofmt" ];
        html = [ "prettier" ];
        javascript = [ [ "prettierd" "prettier" ] ];
        json = [ "prettier" ];
        lua = [ "stylua" ];
        markdown = [ "prettier" ];
        python = [ "isort" "black" ];
        sh = [ "shfmt" ];
        terraform = [ "terraform_fmt" ];
        yaml = [ "yamlfmt" ];

        "*" = [ "codespell" ];
        "_" = [ "trim_whitespace" ];
      };
    };

    gitsigns = {
      enable =  true;
    };

    lualine = {
      enable = true;
    };

    nvim-autopairs = {
      enable =  true;
    };

    nvim-tree = {
      enable = true;
    };

    telescope = {
      enable = true;
    };

    treesitter = {
      enable = true;
    };

    treesitter-textobjects = {
      enable = true;
    };

    ts-autotag = {
      enable = true;
    };
  };

  # Plugins Keymaps
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

    # Telescope
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

  # Nvim-Surround
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    nvim-surround
  ];

  programs.nixvim.extraConfigLua = ''
    require("nvim-surround").setup({})
  '';
}
