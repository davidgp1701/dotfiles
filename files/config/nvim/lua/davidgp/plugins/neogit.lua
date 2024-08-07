return {
  "NeogitOrg/neogit",
  branch = "nightly",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup()
    -- neogit.setup{
    --   kind = "tab",
    --   commit_editor = {
    --     kind = "tab",
    --     showed_staged_diff = false,
    --   },
    --   commit_view = {
    --     kind = "tab",
    --   },
    --   preview_buffer = {
    --     kind = "tab",
    --   },
    --   popup = {
    --     kind = "tab",
    --   },
    --   rebase_editor = {
    --     kind = "tab",
    --   },
    --   merge_editor = {
    --     kind = "tab"
    --   },
    --   tag_editor = {
    --     kind = "tab"
    --   },
    -- }
    --
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Opens Neogit" }) -- toggle file explorer
  end,
}
