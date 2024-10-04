{ config, pkgs, ...}:

{
  imports = [
    ./keymaps.nix
    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/conform.nix
    ./plugins/diffview.nix
    ./plugins/direnv.nix
    ./plugins/extra.nix
    ./plugins/friendly-snippets.nix
    ./plugins/gitsigns.nix
    ./plugins/harpoon.nix
    ./plugins/helm.nix
    ./plugins/indent-blankline.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/luasnip.nix
    ./plugins/neogit.nix
    ./plugins/nvim-autopairs.nix
    ./plugins/nvim-surround.nix
    ./plugins/nvim-tree.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/web-devicons.nix
    ./plugins/whichkey.nix

    # ./colorschemes/gruvbox-material.nix
  ];

  # Dependencies
  home.packages = [
    pkgs.ansible-lint
    pkgs.nodePackages.jsonlint
    pkgs.markdownlint-cli
    pkgs.yamllint
  ];

  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    # Color scheme
    colorschemes.gruvbox = {
      enable = true;
    };
    # colorschemes.rose-pine = {
    #   enable = true;
    #   settings.variant = "moon";
    # };
    #colorschemes.catppuccin.enable = true;
    #colorschemes.catppuccin.settings.flavour = "mocha";

    # Options
    opts = {
      fileencoding = "utf-8";
      hidden = true;
      pumheight = 20;
      cmdheight = 2;
      guicursor = "i:block";
      termguicolors = true;
      splitright = true;
      splitbelow = true;
      conceallevel = 0;
      showtabline = 0;
      backup = false;
      writebackup = false;
      swapfile = false;
      undodir = "${config.home.homeDirectory}/.local/share/nvim/undodir";
      undofile = true;
      updatetime = 50;
      clipboard = "unnamedplus";
      hlsearch = false;
      scrolloff = 8;
      sidescrolloff = 5;
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      cursorline = true;
      tabstop  =  2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      exrc = true;
      incsearch = true;
      laststatus = 2;
      background = "dark";
      completeopt = [ "menu" "menuone" "noselect" ];
      smartcase = true;
      smartindent = true;
    };

    extraConfigVim = builtins.readFile ./init.vim;
  };
}
