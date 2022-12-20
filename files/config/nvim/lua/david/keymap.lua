vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<M-k>", ":resize +2<CR>")
vim.keymap.set("n", "<M-j>", ":resize -2<CR>")
vim.keymap.set("n", "<M-h", ":vertical resize -2<CR>")
vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>")

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Better vertical navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz" )-- Moves half page down and centers cursor in middle of screen
vim.keymap.set("n", "<C-u>", "<C-u>zz" )-- Moves half page up and centers cursor in middle of screen

-- Better search placement
vim.keymap.set("n", "n", "nzzzv" )-- Searchs item and cetners cursor in middle of screen
vim.keymap.set("n", "N", "Nzzzv" )-- Back searchs item and centers cursor in middle of screen

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
vim.keymap.set('n', '<C-P>', ':Telescope neoclip a extra=plus<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
vim.keymap.set('n', '<leader>fi', '<cmd>lua require(\'telescope.builtin\').git_status()<cr>')

-- VISUAL --
-- Better indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("v", "<leader>p", '"_dp')

-- next greatest remap ever : asbjornHaland
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Enable or dissable spellcheck
vim.keymap.set('n', '<leeder>se', ':setlocal spell spelllang=en_us<CR>')
vim.keymap.set('n', '<leader>sd', ':set nospell<CR>')

-- Set the file as executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
