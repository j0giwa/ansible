require("jogiwa.lazy.colors")

ColorMyPencils()
vim.g.have_nerd_font = true

vim.o.mouse = 'a'

vim.o.timeoutlen=2000

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Proper tabstop indentation (so Retro)
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.opt.softtabstop = 0
vim.o.expandtab = true

vim.o.smartindent = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.clipboard = 'unnamedplus'

vim.opt.scrolloff = 8

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Disable autoformat
vim.g.autoformat = false
vim.b.autoformat = false

vim.o.conceallevel=2

