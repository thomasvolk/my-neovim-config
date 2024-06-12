return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set("n", "<C-x>", ":FloatermToggle<CR>", {})
    vim.keymap.set("t", "<C-x>", [[<C-\><C-n>:FloatermToggle<CR>]], {})
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]],{noremap=true})
  end
}
