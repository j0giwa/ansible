local telescope = require('telescope')
local builtin = require('telescope.builtin')
local pickers = require('modules.telescopePickers') 


telescope.setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    file_ignore_patterns = {
      "node%_modules/.*",
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
      "yarn.lock",
      "package%-lock.json",
      "lazy%-lock.json",
    },
  },
})

vim.keymap.set('n', '<leader>pf', function() pickers.prettyFilesPicker( { picker = 'find_files' }) end)
vim.keymap.set('n', '<C-p>', function() pickers.prettyFilesPicker({ picker = 'git_files' })  end)

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
