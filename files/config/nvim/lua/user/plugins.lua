local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Nvim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand taht reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Add plugins in this block
return packer.startup(function(use)
  -- Have packer manage itself
  use "wbthomason/packer.nvim"

  -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/popup.nvim"

  -- Useful lua functions used by lots of plugins
  use "nvim-lua/plenary.nvim"

  -- LSP
  use 'neovim/nvim-lspconfig'
  use { 'nvim-lua/lsp-status.nvim' }
  use 'williamboman/nvim-lsp-installer'
  --
  -- Completion plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "hrsh7th/cmp-nvim-lua" -- Lua autocompletation
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "lukas-reineke/cmp-under-comparator" -- Comparators
  use "tamago324/cmp-zsh" --  Zsh autocomplate
  use { 'onsails/lspkind-nvim' }

  -- Color Theme
  -- use {
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = "require('rose-pine-config')"
  -- }

  --[[ use { ]]
  --[[   "catppuccin/nvim", ]]
  --[[   as = "catppuccin", ]]
  --[[   config = "require('catppuccin-config')" ]]
  --[[ } ]]

  use {
    "ellisonleao/gruvbox.nvim",
    config = "require('gruvbox-config')"
  }

  --[[ use { ]]
  --[[   'katawful/kat.nvim', ]]
  --[[   config = "require('kat-config')" ]]
  --[[ } ]]

  --[[ use { ]]
  --[[   'rebelot/kanagawa.nvim', ]]
  --[[   config = "require('kanagawa-config')" ]]
  --[[ } ]]

  -- Dev Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = 'require("telescope-config")'
  }
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = 'require("treesitter-config")',
  }
  --use { 'nvim-treesitter/playground' }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = 'require("autopairs-config")',

  }

  -- Comment blocks
  use {
    'numToStr/Comment.nvim',
    config = 'require("comment-config")',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Gitsigns configuration
  use {
    'lewis6991/gitsigns.nvim',
    config = 'require("gitsigns-config")',
  }

  -- Git related plugins
  use { 'tpope/vim-fugitive' }

  -- Nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    config = 'require("nvim-tree-config")'
  }

  -- New more informative line
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = 'require("lualine-config")'
  }
  --
  -- Tabs
  use {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons',
    config = 'require("bufferline-config")'
  }

  -- Show indent lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'master',
    config = 'require("indentblackline-config")'
  }

  -- Basic plugins for me
  use { 'tpope/vim-surround' }

  -- Faster horizontal movement
  use { 'unblevable/quick-scope' }

  -- Vim Cyclest to show listchars
  use { 'tjdevries/cyclist.vim' }

  -- Use .editorconfig file from projects for indents
  use { 'editorconfig/editorconfig-vim' }

  -- Neovim Org mode
  use {
    'nvim-neorg/neorg',
    requires = 'nvim-lua/plenary.nvim',
    config = 'require("neorg-config")'
  }

  -- NeoClip - Clipboard manager
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'tami5/sqlite.lua', module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
    },
    config = "require('neoclip-config')"
  }

  -- Show colors from color codes
  use {
    'norcalli/nvim-colorizer.lua',
    config = 'require("colorizer-config")'
  }
  --
  -- Terraform/Packer/etc.
  use {
    'hashivim/vim-hashicorp-tools',
    config = "require('terraform-config')"
  }

  -- Changes the default root directory
  use {
    'airblade/vim-rooter',
    config = "require('vim-rooter-config')"
  }

  -- Automatically set up your configuration after cloning packer
  -- It needs to be at the end
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
