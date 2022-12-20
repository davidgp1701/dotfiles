vim.cmd('filetype plugin indent on')

vim.o.fileencoding = "utf-8"

-- don't show the dumb matching stuff
vim.o.shortmess = vim.o.shortmess .. 'c'

-- required to keep multiple buffers
vim.o.hidden=true

-- maximum number of items in the pop up menu
vim.o.pumheight = 20

-- give more space for displaying messages in cmd
vim.o.cmdheight = 2

-- enables 24 bits colors
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- controls how splits are created
vim.o.splitright = true
vim.o.splitbelow = true

-- no hide text
vim.o.conceallevel = 0

-- always show tabs
vim.o.showtabline = 2

-- no backups or swap file
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.cmd([[
  set undodir=~/.local/share/nvim/undo
  set undofile
]])

-- improves user experience, default time is 4000ms
vim.o.updatetime = 50
-- vim.o.timeoutlen = 100

-- copy and paste between vim and everything else
vim.o.clipboard = "unnamedplus"

-- no keep search highlights
vim.o.hlsearch = false

-- always have the cursor 8 lines of buffer with respect the end
vim.o.scrolloff = 8
vim.o.sidescrolloff = 5

-- no sounds when error
vim.o.errorbells = true

-- no wrap
vim.wo.wrap = true

-- shows the current line number
vim.wo.number = true

-- sets relative numbers
vim.wo.relativenumber = true

-- extra column for git plugins and linting
vim.wo.signcolumn = "yes"

-- enable highlighting of the current line
vim.wo.cursorline = true

-- insert 2 spaces for a tab
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

-- loads project specific .nvimrc file
vim.o.exrc = true

-- performs incremental searchs
vim.o.incsearch = true

-- always display the status line
vim.o.laststatus = 2

-- show 120 columns
vim.cmd('set colorcolumn=120')

-- color theme aspects
vim.o.background = "dark"

-- for cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- we want to show smartcase and indent
vim.opt.smartcase = true
vim.opt.smartindent = true

-- neovim 0.8, disable mouse
vim.cmd([[
  set mouse=
]])

-- allow usage of mouse
-- vim.o.mouse = "a"

