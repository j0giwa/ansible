local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    file_ignore_patterns = {
      "node%_modules/.*",
      "%.env",
      "yarn.lock",
      "package%-lock.json",
      "lazy%-lock.json",
      "init.sql",
      "target/.*",
      ".git/.*",
      ".cache",
      "*.o",
      "*.a",
      "*.out",
      "*.class",
      "*.pdf",
      "*.mkv",
      "*.mp4",
      "*.zip",
      "%.env",
   },
  },
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
