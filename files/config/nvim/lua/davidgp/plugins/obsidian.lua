return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "vault",
        path = "~/Documents/obsidian/vault",
      },
    },

    notes_subdir = "notes",

    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil,
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    new_notes_location = "current_dir",

    picker = {
      name = "telescope.nvim",
      mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
    },

    ui = {
      enable = false,
    },
  },
}
