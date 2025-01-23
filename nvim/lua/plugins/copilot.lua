return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set('i', '<F1>', 'copilot#Accept()', { noremap = true, expr = true, silent = true, replace_keycodes = false })
    vim.keymap.set('i', '<F2>', 'copilot#Accept()', { noremap = true, expr = true, silent = true, replace_keycodes = false })
  end
}
