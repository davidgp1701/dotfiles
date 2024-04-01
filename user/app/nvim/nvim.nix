{ config, pkgs,...}:

{
  imports = [
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    # Color scheme
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.flavour = "mocha";

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
