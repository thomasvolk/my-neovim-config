return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set('i', '<F2>', 'copilot#Accept()', { noremap = true, expr = true, silent = true, replace_keycodes = false })
    vim.keymap.set('n', '<F3>', ':Copilot enable<CR>', {})
    vim.keymap.set('n', '<F4>', ':Copilot disable<CR>', {})
  end
}
