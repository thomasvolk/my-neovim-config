return {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        vim.keymap.set("n", "<C-r>", ":GrugFar<CR>", {})
      });
    end
  }
