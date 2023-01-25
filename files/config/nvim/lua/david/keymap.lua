vim.g.mapleader = " "

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
  desc = "Moves half page down and centers the cursor in the middle of the screen"
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
  desc = "Moves half page up and centers the cursor in the middle of the screen"
})

vim.keymap.set("n", "n", "nzzzv", { desc = "Searchs item an centers the cursor in the middle of the screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Back searchs item and cetners cursor in the middle of the screen" })

vim.keymap.set("v", "<", "<gv", { desc = "Moves selected text indentation to the left" })
vim.keymap.set("v", ">", ">gv", { desc = "Moves selected text indentation to the right"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves selected line up" })

vim.keymap.set("v", "<leader>p", '"_dp', { desc = "Pastes test without overwritting the clipboard" })

vim.keymap.set('n', '<leader>y', '"+y', { desc = "Copies to the OS clipboard" })
vim.keymap.set('v', '<leader>y', '"+y', { desc = "Copies to the OS clipboard" })

vim.keymap.set('n', '<leader>d', '"_d', { desc = "Deletes text without copying it to the clipboard" })
vim.keymap.set('v', '<leader>d', '"_d', { desc = "Deletes text without copying it to the clipboard" })

vim.keymap.set('n', '<leader>se', ':setlocal spell spelllang=en_us<CR>', {
  desc = "Enables the English spellcheck for the actual buffer"
})
vim.keymap.set('n', '<leader>sd', ':set nospell<CR>', { desc = "Disables the spellchecker for the actual buffer" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Makes the actual file executable" })


vim.keymap.set("n", '<leader>nf', ":lua require('telekasten').find_notes()<CR>", { desc = "Find a note"})
vim.keymap.set("n", '<leader>nd', ":lua require('telekasten').find_daily_notes()<CR>", { desc = "Find a daiy note"})
vim.keymap.set("n", '<leader>ng', ":lua require('telekasten').search_notes()<CR>", { desc = "Search in notes"})
vim.keymap.set("n", '<leader>nz', ":lua require('telekasten').follow_link()<CR>", { desc = "Follow link"})
vim.keymap.set("n", '<leader>nT', ":lua require('telekasten').goto_today()<CR>", { desc = "Go to Today"})
vim.keymap.set("n", '<leader>nW', ":lua require('telekasten').goto_thisweek()<CR>", { desc = "Go to this week"})
vim.keymap.set("n", '<leader>nw', ":lua require('telekasten').find_weekly_notes()<CR>", { desc = "Find weekly notes"})
vim.keymap.set("n", '<leader>nn', ":lua require('telekasten').new_note()<CR>", { desc = "New note"})
vim.keymap.set("n", '<leader>nN', ":lua require('telekasten').new_templated_note()<CR>", { desc = "New templated note"})
vim.keymap.set("n", '<leader>ny', ":lua require('telekasten').yank_notelink()<CR>", { desc = "Yank note link"})
vim.keymap.set("n", '<leader>nc', ":lua require('telekasten').show_calendar()<CR>", { desc = "Show Calendar"})
vim.keymap.set("n", '<leader>nC', ":CalendarT<CR>", { desc = ""})
vim.keymap.set("n", '<leader>ni', ":lua require('telekasten').paste_img_and_link()<CR>", {
  desc = "Paste image and link into the note"})
vim.keymap.set("n", '<leader>nt', ":lua require('telekasten').toggle_todo()<CR>", { desc = "Toggle todo"})
vim.keymap.set("n", '<leader>nb', ":lua require('telekasten').show_backlinks()<CR>", { desc = "Show backlinks"})
vim.keymap.set("n", '<leader>nF', ":lua require('telekasten').find_friends()<CR>", { desc = "Find friends"})
vim.keymap.set("n", '<leader>nI', ":lua require('telekasten').insert_img_link({ i=true })<CR>", {
  desc = "Insert image link"})
vim.keymap.set("n", '<leader>np', ":lua require('telekasten').preview_img()<CR>", { desc = "Preview image"})
vim.keymap.set("n", '<leader>nm', ":lua require('telekasten').browse_media()<CR>", { desc = "Browse media"})
vim.keymap.set("n", '<leader>na', ":lua require('telekasten').show_tags()<CR>", { desc = "Show tags"})
vim.keymap.set("n", '<leader>nr', ":lua require('telekasten').rename_note()<CR>", { desc = "Rename note"})

