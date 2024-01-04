vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Saves actual buffer to file" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Moves to the window on the left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Moves to cursor down a window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Moves the cursor up a window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Moves to the window on the right" })

vim.keymap.set("n", "<M-k>", ":resize +2<CR>", { desc = "Resizes the window from the top side" })
vim.keymap.set("n", "<M-j>", ":resize -2<CR>", { desc = "Resizes the window from the button side" })
vim.keymap.set("n", "<M-h", ":vertical resize -2<CR>", { desc = "Resizes the window from the left side" })
vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", { desc = "Resizes the window from the right side" })

vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Moves to the next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Moves to the previous buffer" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", {
  desc = "Moves half page down and centers the cursor in the middle of the screen",
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
  desc = "Moves half page up and centers the cursor in the middle of the screen",
})

vim.keymap.set("n", "n", "nzzzv", { desc = "Searchs item an centers the cursor in the middle of the screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Back searchs item and cetners cursor in the middle of the screen" })

vim.keymap.set("v", "<", "<gv", { desc = "Moves selected text indentation to the left" })
vim.keymap.set("v", ">", ">gv", { desc = "Moves selected text indentation to the right" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves selected line up" })

vim.keymap.set("v", "<leader>p", '"_dp', { desc = "Pastes test without overwritting the clipboard" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copies to the OS clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copies to the OS clipboard" })

vim.keymap.set("n", "<leader>d", '"_d', { desc = "Deletes text without copying it to the clipboard" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Deletes text without copying it to the clipboard" })

vim.keymap.set("n", "<leader>se", ":setlocal spell spelllang=en_us<CR>", {
  desc = "Enables the English spellcheck for the actual buffer",
})
vim.keymap.set("n", "<leader>sd", ":set nospell<CR>", { desc = "Disables the spellchecker for the actual buffer" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Makes the actual file executable" })
