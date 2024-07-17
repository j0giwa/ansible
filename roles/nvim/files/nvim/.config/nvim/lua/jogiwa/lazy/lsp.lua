return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

      local servers = {
        clangd = {},
        jdtls= {},
        --r_language_server = {},
        pyright = {},
        rust_analyzer = {},
        tsserver = {},
        html = {},
        lua_ls = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
              },
            },
            telemetry = { enable = false },
          },
        },
      }

      require("fidget").setup({})
      require("mason").setup()
      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              settings = servers[server_name],
              filetypes = (servers[server_name] or {}).filetypes,
            }
          end,
        },
      }

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        {
          { name = 'buffer' },
        })
     })

     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
       vim.lsp.handlers.hover, {
         border = "single"
       }
     )

     vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
       vim.lsp.handlers.signature_help, {
         border = "single"
       }
     )

     vim.diagnostic.config({
       -- update_in_insert = true,
       float = {
         focusable = false,
         style = "minimal",
         border = "rounded",
         source = "always",
         header = "",
         prefix = "",
       },
     })
    end
  },
}
