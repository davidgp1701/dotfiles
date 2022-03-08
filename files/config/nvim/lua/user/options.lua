vim.cmd('filetype plugin indent on')

vim.o.fileencoding = "utf-8"

-- Don't show the dumb matching stuff
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Required to keep multiple buffers
vim.o.hidden=true

-- Maximum number of items in the pop up menu
vim.o.pumheight = 20

-- Give more space for displaying messages in CMD
vim.o.cmdheight = 2

-- Enables 24 bits colors
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Controls how splits are created
vim.o.splitright = true
vim.o.splitbelow = true

-- No hide text
vim.o.conceallevel = 0

-- Always show tabs
vim.o.showtabline = 2

-- No backups or swap file
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.cmd([[
  set undodir=~/.local/share/nvim/undo
  set undofile
]])

-- Improves user experience, default time is 4000ms
vim.o.updatetime = 50
-- vim.o.timeoutlen = 100

-- Copy and paste between vim and everything else
vim.o.clipboard = "unnamedplus"

-- No keep search highlights
vim.o.hlsearch = false

-- Always have the cursor 8 lines of buffer with respect the end
vim.o.scrolloff = 8
vim.o.sidescrolloff = 5

-- Allow usage of mouse
-- vim.o.mouse = "a"

-- No sounds when error
vim.o.errorbells = true

-- No wrap
vim.wo.wrap = true

-- Shows the current line number
vim.wo.number = true

-- Sets relative numbers
vim.wo.relativenumber = true

-- Extra column for git plugins and linting
vim.wo.signcolumn = "yes"

-- Enable highlighting of the current line
vim.wo.cursorline = true

-- Insert 2 spaces for a tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- Loads project specific .nvimrc file
vim.o.exrc = true

-- Performs incremental searchs
vim.o.incsearch = true

-- Always display the status line
vim.o.laststatus = 2

-- Show 120 columns
vim.cmd('set colorcolumn=120')

-- Color theme aspects
vim.o.background = "dark"

-- For CMP
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- We want to show smartcase and indent
vim.opt.smartcase = true
vim.opt.smartindent = true
