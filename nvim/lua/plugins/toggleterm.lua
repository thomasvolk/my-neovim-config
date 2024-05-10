return {
  'akinsho/toggleterm.nvim', 
  version = "*", 
  config = function()
    require("toggleterm").setup{}
    vim.keymap.set("n", "<Leader>tt", ":ToggleTerm<CR>", {})
  end
}
