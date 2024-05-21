-- leaser key
vim.g.mapleader = ' '

-- tab behaviour
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- show linenumbers
vim.wo.number = true

-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line
-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor
