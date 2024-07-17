require("jogiwa.lazy.colors")

vim.g.have_nerd_font = true

-- Enable mouse mode
vim.o.mouse = 'a'

vim.o.timeoutlen=2000

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

--vim.o.tabstop = 8
--vim.o.shiftwidth = 8
vim.o.tabstop = 4
vim.o.shiftwidth = 4
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
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

ColorMyPencils()

-- Disable autoformat
vim.g.autoformat = false -- globally
vim.b.autoformat = false -- buffer-local:

vim.o.conceallevel=2

