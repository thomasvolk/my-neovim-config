return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup{}
    vim.keymap.set("n", "<Leader>tt", ":ToggleTerm<CR>", {})
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]],{noremap=true})
  end
}
