--  This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as 'opt'
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        -- Packer can manage itseld
        use 'wbthomason/packer.nvim'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
                requires = { {'nvim-lua/plenary.nvim'} }
        }

        use({ 
                'Mofiqul/dracula.nvim',
                config = function()
                        vim.cmd[[colorscheme dracula-soft]]
                end
        })

        use ('nvim-treesitter/nvim-treesitter',{run = ':TSUPdate'})
        use ('nvim-treesitter/playground')
        use ('theprimeagen/harpoon')
        use ('mbbill/undotree')
        use ('tpope/vim-fugitive')

        use {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v2.x',
                requires = {
                        -- LSP Support
                        {'neovim/nvim-lspconfig'},             -- Required
                        {'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end,},-- Optional
                        {'williamboman/mason-lspconfig.nvim'}, -- Optional
                        -- Autocompletion
                        {'hrsh7th/nvim-cmp'},     -- Required
                        {'hrsh7th/cmp-nvim-lsp'}, -- Required
                        {'L3MON4D3/LuaSnip'},     -- Required
                }
        }

end)