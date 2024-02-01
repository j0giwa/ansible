require("lazy").setup({
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'ellisonleao/gruvbox.nvim',
  'nvim-lualine/lualine.nvim',
  'theprimeagen/harpoon',
  'christoomey/vim-tmux-navigator',
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

