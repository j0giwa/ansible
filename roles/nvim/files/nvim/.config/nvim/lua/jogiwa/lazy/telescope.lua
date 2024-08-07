return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.5",
    dependencies = {"nvim-lua/plenary.nvim",},
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local pickers = require('jogiwa.modules.telescopePickers')

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
	        "*.zip",
	        "*.env",
	        "yarn.lock",
	        "package%-lock.json",
	        "lazy%-lock.json",
          },
        },
      })

      --vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      --vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>pf', function() pickers.prettyFilesPicker( { picker = 'find_files' }) end)
      vim.keymap.set('n', '<C-p>', function() pickers.prettyFilesPicker({ picker = 'git_files' })  end)

      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)

      vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
  },
}

