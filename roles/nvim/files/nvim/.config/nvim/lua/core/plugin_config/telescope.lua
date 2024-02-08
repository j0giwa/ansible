local telescope = require('telescope')
telescope.setup{
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
                        "init.sql",
                },
        },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
