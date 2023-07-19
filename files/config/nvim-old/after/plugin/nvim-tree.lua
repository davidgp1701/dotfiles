-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  sort_by = "case_sensitive",

  actions = {
    open_file = {
      quit_on_open = true
    },
  },

  git = {
    ignore = true
  },


  -- open the tree at setup
  open_on_setup = false,
  -- opens the tree when chaning/opening a new tab if it wasn't open
  open_on_tab = false,

  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },

  view = {
    adaptive_size = true,
  },
})

-- nvim-tree file namager configuration
vim.g.nvim_tree_indent_markers         = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl                 = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_width_allow_resize     = 1 -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_width                  = 40 -- 30 by default, can be width_in_columns or 'width_in_percent%'
vim.g.nvim_tree_side                   = 'left' -- left by default
-- vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier   = ':~' -- This is the default. See :help filename-modifiers for more options
-- vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
-- vim.g.nvim_tree_group_empty = 0 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_disable_window_picker  = 0 -- 0 by default, will disable the window picker.
vim.g.nvim_tree_icon_padding           = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
-- vim.g.nvim_tree_update_cwd = 1 -- 0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
  ['default'] = '',
  ['symlink'] = '',
  ['git'] = {
    ['unstaged'] = "✗",
    ['staged'] = "✓",
    ['unmerged'] = "",
    ['renamed'] = "➜",
    ['untracked'] = "★",
    ['deleted'] = "",
    ['ignored'] = "◌"
  },
  ['folder'] = {
    ['arrow_open'] = "",
    ['arrow_closed'] = "",
    ['default'] = "",
    ['open'] = "",
    ['empty'] = "",
    ['empty_open'] = "",
    ['symlink'] = "",
    ['symlink_open'] = ""
  },
  ['lsp'] = {
    ['hint'] = "",
    ['info'] = "",
    ['warning'] = "",
    ['error'] = ""
  }
}

-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
vim.g.nvim_tree_special_files = {
  ['README.md'] = 1,
  ['Makefile'] = 1,
  ['MAKEFILE'] = 1
} --  List of filenames that gets highlighted with NvimTreeSpecialFile

vim.g.nvim_tree_show_icons = {
  ['git'] = 1,
  ['folders'] = 1,
  ['files'] = 1,
  ['folder_arrows'] = 1,
}

-- nvim-tree remaps
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true })

