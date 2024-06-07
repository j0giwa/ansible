require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = 'right',
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
