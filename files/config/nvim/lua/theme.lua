vim.o.background='dark'

-- Gruvbox color scheme
vim.g.gruvbox_contrast_dark='hard'
vim.g.gruvbox_italic=1
-- vim.g.airline_theme='gruvbox'

-- TokyoDark color scheme
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"

-- Active colorscheme
vim.cmd('set termguicolors')
vim.cmd[[colorscheme gruvbox]]
-- vim.cmd("colorscheme tokyodark")
-- require('colorbuddy').colorscheme('gruvbuddy')
