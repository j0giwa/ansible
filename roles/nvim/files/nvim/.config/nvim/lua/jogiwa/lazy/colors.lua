function ColorMyPencils(color)
  color = color or "rose-pine-moon"

  vim.o.termguicolors = true
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNc", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
end

return {
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    config = function()
      require("dracula").setup({
        show_end_of_buffer = true,
        transparent_bg = true,
        italic_comment = false,
      })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = {
          italic =  false,
        },
      })
    end
  },
}

