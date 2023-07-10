function Colorize(color)
        color = color or "dracula"
        vim.cmd.colorscheme(color)
end
Colorize()
