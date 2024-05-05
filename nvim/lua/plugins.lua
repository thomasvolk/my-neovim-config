
return {
    {
      "catppuccin/nvim", 
      name = "catppuccin", 
      priority = 1000, 
      config = function() 
        vim.cmd.colorscheme "catppuccin"
      end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        config = function()
          vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
        end
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "lua", "ocaml", "python", "javascript", "java", "bash", "xml", "yaml" }
      })
    end
    }
}
