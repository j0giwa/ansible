require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "jdtls",
    "r_language_server",
    "pyright",
    "rust_analyzer",
    "tsserver",
  }
})
local on_attach = function(_, _)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition(), {})
  vim.keymap.set("n", "K", vim.lsp.buf.hover(), {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol(), {})
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float(), {})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next(), {})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev(), {})
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action(), {})
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references(), {})
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename(), {})
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help(), {})
end

local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilitys = capabilitys,
}
lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilitys = capabilitys,
}
lspconfig.r_language_server.setup {
  on_attach = on_attach,
  capabilitys = capabilitys,
}
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilitys = capabilitys,
}
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilitys = capabilitys,
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilitys = capabilitys,
}

