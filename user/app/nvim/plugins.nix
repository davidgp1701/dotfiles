{ config, pkgs,...}:

{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;

      settings = {
        completion = {
          completopt = "menu,menuone,preview,noselect";
        };

        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "luasnip"; }
          { name = "path"; }
        ];
      };
    };

    cmp-buffer.enable =  true;
    cmp_luasnip.enable =  true;
    cmp-nvim-lsp.enable =  true;
    cmp-path.enable =  true;

    comment = {
      enable = true;
    };

    conform-nvim = {
      enable =  true;

      settings ={
        format_on_save = {
          lspFallback = true;
          timeoutMs = 1000;
        };

        formatters_by_ft = {
          bash = [ "shfmt" ];
          css = [ "prettier" ];
          go = [ "gofmt" ];
          html = [ "prettier" ];
          # javascript = [ [ "prettierd" "prettier" ] ];
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
    };

    diffview.enable = true;

    friendly-snippets.enable = true;

    gitsigns = {
      enable =  true;
    };

    lualine = {
      enable = true;
    };

    luasnip = {
      enable = true;

      settings = {
        history = true;
        delete_check_events = "TextChanged";
      };
    };

    lsp = {
      enable = true;

      servers = {
        bashls.enable  = true;

        nixd.enable = true;
      };
    };

    lspkind = {
      enable = true;
    };

    neogit = {
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
    # Luasnip
    {
      mode = [ "i" "s" ];
      key  = "<C-L>";
      action = "function() require(\"luasnip\").jump(1) end";
    }
    {
      mode = [ "i" "s" ];
      key  = "<C-J>";
      action = "function() require(\"luasnip\").jump(-1) end";
    }

    # Neogit
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Neogit<CR>";
      options.desc = "Opens Neogit";
    }

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
    ( pkgs.vimUtils.buildVimPlugin {
      name = "cyclest";
      src = pkgs.fetchFromGitHub {
          owner = "tjdevries";
          repo = "cyclist.vim";
          rev = "d611ea3a21365f90d512dd024874e070e864309e";
          hash = "sha256-CpfY2luD59p4FM9cvGsn6pyEFMAUv1vi2+WL27e6Pjk=";
        };
    })
    nvim-surround
  ];

  programs.nixvim.extraConfigLua = ''
    require("nvim-surround").setup({})
  '';

  programs.nixvim.extraConfigVim = ''
      call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

      call cyclist#add_listchar_option_set('default', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '·',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

      call cyclist#activate_listchars('default')
  '';
}
