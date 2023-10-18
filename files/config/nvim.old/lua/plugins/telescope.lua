return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><space>",
      function()
        local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        require("telescope.builtin").find_files({ cwd = root })
      end,
      desc = "Find File Git root",
    },
    {
      "<leader>/",
      function()
        local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        require("telescope.builtin").live_grep({ cwd = root })
      end,
      desc = "Grep (root dir)",
    },
  },
}
