require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          personal = "~/Documents/synced/neorg/personal",
          adaptive = "~/Documents/synced/neorg/adaptive"
        }
      }
    },
    ["core.norg.completion"] = {
    config = {
      engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
      }
    }
  },
}

local neorg_callbacks = require('neorg.callbacks')

-- NEORG KEYBINDS

-- Keys for managing TODO items and setting their states
neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, content)

	if content.mode == "special-mode" then
		content.map('n', "<C-s>", ":w<CR>", { silent = true })
	end

	content.map_to_mode("special-mode", {
		n = {
			{ "<C-s>", ":w<CR>" }
		}
	}, { silent = true })

	content.map_event_to_mode("norg", {
		n = {
			{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
			{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
			{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
			{ "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" }
		},
	}, { silent = true, noremap = true })

end)

-- Add TreeSitter support for neorg
-- You need to execute: TSInstall norg
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main"
  },
}
