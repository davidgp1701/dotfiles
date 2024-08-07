return {
  "FabijanZulj/blame.nvim",
  config = function()
    require("blame").setup()

    vim.keymap.set("n", "<leader>gb", "<cmd>BlameToggle<CR>", { desc = "Opens Neogit" })
  end
}

