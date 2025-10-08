local ai = os.getenv("NVIM_EDITOR_AI")
if ai == nil then
  ai = os.getenv("EDITOR_AI")
end

if ai and string.lower(ai) == "copilot" then
  return {
    "github/copilot.vim",
    config = function()
      vim.keymap.set('i', '<F2>', 'copilot#Accept()', { noremap = true, expr = true, silent = true, replace_keycodes = false })
      vim.keymap.set('n', '<F3>', ':Copilot enable<CR>', {})
      vim.keymap.set('n', '<F4>', ':Copilot disable<CR>', {})
    end
  }
end

if ai and string.lower(ai) == "codeium" then
  return {
    'Exafunction/windsurf.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<F2>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('n', '<F3>', ":Codeium Enable<CR>", {})
      vim.keymap.set('n', '<F4>', ":Codeium Disable<CR>", {})
      -- disable codeium by default
      vim.g.codeium_enabled = false
    end
  }
end

return {}
