return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              main = "~/Documents/notes/main",
              work = "~/Documents/notes/work",
            },
            default_workspace = "main",
          },
        },
      },
    })
  end,
}
