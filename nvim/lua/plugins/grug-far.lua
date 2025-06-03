return {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        vim.keymap.set("n", "<Leader>r", ":GrugFar<CR>", {})
      });
    end
  }
