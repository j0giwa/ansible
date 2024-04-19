require("lazy").setup({
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  "lewis6991/gitsigns.nvim",
  'Mofiqul/dracula.nvim',
  'rose-pine/neovim',
  'martineausimon/nvim-xresources',
  'nvim-lualine/lualine.nvim',
  'ThePrimeagen/harpoon',
  'ThePrimeagen/git-worktree.nvim',
  'christoomey/vim-tmux-navigator',
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim',},
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  },
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
})

