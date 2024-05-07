
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
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
