vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable mouse mode
vim.o.mouse = 'a'

-- Set highlight on search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = false

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- old-school indentation
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 8
vim.opt.expandtab = false

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
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Disable autoformat
vim.g.autoformat = false -- globally
vim.b.autoformat = false -- buffer-local:

vim.o.conceallevel=2
