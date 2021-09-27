require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}

-- nvim-tree file namager configuration
vim.g.nvim_tree_ignore = {'.git', '.terraform', 'node_modules', '.cache'}
vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_width_allow_resize  = 1 -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_width = 40 -- 30 by default, can be width_in_columns or 'width_in_percent%'
vim.g.nvim_tree_side = 'left' -- left by default
vim.g.nvim_tree_gitignore = 1 -- 0 by default
-- vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_hide_dotfiles = 0 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
-- vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
-- vim.g.nvim_tree_group_empty = 0 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_disable_window_picker = 0 -- 0 by default, will disable the window picker.
vim.g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
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
    ['arrow_open' ] = "",
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

-- Keyremaps in Keymaps file
