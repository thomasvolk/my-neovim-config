-- leaser key
vim.g.mapleader = ' '

-- tab behaviour
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- show linenumbers
vim.wo.number = true

-- shortcuts
vim.keymap.set('n', '<C-b>', ':bn<CR>', {})
vim.keymap.set('n', '<C-.>', ':q<CR>', {})
