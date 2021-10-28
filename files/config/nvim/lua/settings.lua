-- Enable highlighting of the current line
vim.wo.cursorline=true

-- Shows current line number
vim.wo.number=true

-- Extra column for git plugins and linting
vim.wo.signcolumn="yes"

-- Sets relative numbers
vim.wo.relativenumber=true

-- Copy and paste between vim and everything else
vim.o.clipboard="unnamedplus"

-- Loads project specific .nvimrc file
vim.o.exrc=true

-- No keep search highligths
vim.o.hlsearch=false

-- Performs incremental searchs
vim.o.incsearch=true

-- Required to keep multiple buffers
vim.o.hidden=true

-- No sounds when error
vim.o.errorbells=true

-- Insert 2 spaces for a tab
-- vim.bo.tabstop=2 -- Need to check the right way to do this, it is not working
-- vim.bo.softtabstop=2
-- Changes the number of spaces used for indentation
-- Converts tabs for spaces
-- vim.bo.expandtab=true
-- vim.bo.shiftwidth=2
-- Makes indentation smart
-- vim.bo.smartindent=true
vim.cmd('set ts=2')
vim.cmd('set sw=2')
vim.cmd('set sts=2')
vim.cmd('set expandtab')
vim.cmd('set smartindent')
vim.cmd('filetype plugin indent on')

-- Always display the status line
vim.o.laststatus=0

-- Always shows tabs
vim.o.showtabline=2

-- No backups or swap file
vim.o.backup=false

-- No backups or swap file
vim.o.writebackup=false

-- No swap file
vim.o.swapfile=false

vim.cmd([[
  set undodir=~/.local/share/nvim/undo " Undo folder
  set undofile                         " Enable undo file
]])

-- Enables 24 bits colors
vim.o.termguicolors=true

-- Always have the cursor 8 lines of buffer with respect the end
vim.o.scrolloff=8

-- Give more space for displaying messages.
vim.o.cmdheight=2

-- Improves user experience, default time is 4000ms
vim.o.updatetime=50

-- Show 80 columns
vim.cmd('set colorcolumn=80')

--- Always show statusline
vim.cmd('set laststatus=2')
