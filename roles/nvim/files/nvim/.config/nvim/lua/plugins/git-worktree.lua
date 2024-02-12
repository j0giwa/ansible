
local worktree = require("git-worktree")
local teletree = require("telescope").load_extension("git_worktree")

worktree.setup({
    change_directory_command = "cd", -- default: "cd",
    update_on_change = true, -- default: true,
    update_on_change_command = "e .", -- default: "e .",
    clearjumps_on_change = true, -- default: true,
    autopush = false, -- default: false,
})

vim.keymap.set("n", "<leader>wf", function() teletree.git_worktree() end)
vim.keymap.set("n", "<leader>wc", function() teletree.create_git_worktree() end)
