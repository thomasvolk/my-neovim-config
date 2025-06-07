return {
  'Exafunction/windsurf.vim',
  event = 'BufEnter',
  config = function()
    vim.keymap.set('i', '<F2>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
  end
}
