-- leaser key
vim.g.mapleader = ' '

-- tab behavior
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- show line numbers
vim.wo.number = true

-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line
-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor

-- spellcheck
vim.opt.spelllang = {'en_us', 'de_de'}
vim.opt.spell = true

-- inline messages
vim.diagnostic.config({ virtual_text = true })

-- lsp navigation
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end)
vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end)
vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
