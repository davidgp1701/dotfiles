vim.cmd('filetype plugin indent on')
vim.opt.fileencoding = "utf-8"

-- required to keep multiple buffers
vim.opt.hidden=true

-- maximum number of items in the pop up menu
vim.opt.pumheight = 20

-- give more space for displaying messages in cmd
vim.opt.cmdheight = 2

vim.opt.guicursor = "i:block"

-- enables 24 bits colors
vim.opt.termguicolors = true

-- controls how splits are created
vim.opt.splitright = true
vim.opt.splitbelow = true

-- no hide text
vim.opt.conceallevel = 0

-- always show tabs
vim.opt.showtabline = 2

-- no backups or swap file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

-- improves user experience, default time is 4000ms
vim.opt.updatetime = 50

-- copy and paste between vim and everything else
-- vim.opt.clipboard = "unnamedplus"

-- no keep search highlights
vim.opt.hlsearch = false

-- always have the cursor 8 lines of buffer with respect the end
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5

-- no sounds when error
vim.opt.errorbells = true

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
vim.opt.tabstop = 2
vim.bo.tabstop = 2
vim.opt.softtabstop = 2
vim.bo.softtabstop = 2
vim.opt.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.opt.autoindent = true
vim.bo.autoindent = true
vim.opt.expandtab = true
vim.bo.expandtab = true

-- loads project specific .nvimrc file
vim.opt.exrc = true

-- performs incremental searchs
vim.opt.incsearch = true

-- always display the status line
vim.opt.laststatus = 2

-- show 120 columns
vim.cmd('set colorcolumn=120')

-- color theme aspects
vim.opt.background = "dark"

-- for cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- we want to show smartcase and indent
vim.opt.smartcase = true
vim.opt.smartindent = true

-- neovim 0.8, disable mouse
vim.cmd([[
  set mouse=
]])



