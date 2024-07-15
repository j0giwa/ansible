function ColorMyPencils(color)
  color = color or "rose-pine-moon"

  vim.o.termguicolors = true
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

--ColorMyPencils()

return {
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    config = function()
      require("dracula").setup({
        show_end_of_buffer = true, -- default false
        transparent_bg = true, -- default false
        lualine_bg_color = "#44475a", -- default nil
        italic_comment = true, -- default false  
      })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        styles = {
          transparency = true,
        },
      })
    end
  },
}

