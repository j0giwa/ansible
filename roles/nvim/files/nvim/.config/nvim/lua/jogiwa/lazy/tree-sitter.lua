-- Highlight, edit, and navigate code

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = true,
        highlight = {
	  enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
}
