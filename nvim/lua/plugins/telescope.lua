
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim'
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>bd', ':bd<CR>', {})

    local telescope = require('telescope')

    telescope.load_extension("live_grep_args")

    telescope.setup{
      defaults = {
        file_ignore_patterns = {
          ".idea", ".git/",
          "node_modules/",
          "env/", "venv/", "__pycache__/",
          "_build/"
        }
      }
    }

    vim.keymap.set('n', '<leader>fs', telescope.extensions.live_grep_args.live_grep_args, { noremap = true })
  end
}
