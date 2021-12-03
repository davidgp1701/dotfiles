vim.o.background='dark'
vim.cmd('set termguicolors')

-- Gruvbox color scheme
vim.g.gruvbox_contrast_dark='hard'
vim.g.gruvbox_italic=1
-- vim.g.airline_theme='gruvbox'

-- Tokyonight color scheme
vim.g.tokyonight_style='night'
vim.g.tokyonight_colors = { comment = "#767fa9" }

vim.cmd[[colorscheme tokyonight]]
-- Active colorscheme
-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd("colorscheme tokyodark")
-- require('colorbuddy').colorscheme('gruvbuddy')
