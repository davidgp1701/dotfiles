local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Adds file to Harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Show Harpoon file selector" })

