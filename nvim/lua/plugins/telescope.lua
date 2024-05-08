
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>bd', ':bd<CR>', {})

    require('telescope').setup{ 
      defaults = { 
        file_ignore_patterns = { 
          ".idea", ".git",
          "node_modules",
          "env", "venv", "__pycache__",
          "_build"
        }
      }
    }
  end
}
