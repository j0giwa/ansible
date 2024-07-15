return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function ()
      require("obsidian").setup({
        workspaces = {
          {
            name = "Obsidian",
            path = "~/Documents/Obsidian",
          },
        },
        completion = {
          -- Set to false to disable completion.
          nvim_cmp = true,
          -- Trigger completion at 2 chars.
          min_chars = 2,
        },
        templates = {
          subdir = "Templates",
          date_format = "%Y-%m-%d-%a",
          time_format = "%H:%M",
        },
      })
    end
  },
}

