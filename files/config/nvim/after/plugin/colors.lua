function MyColors(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
end

MyColors()
