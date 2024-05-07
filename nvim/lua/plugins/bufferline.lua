return {
  "akinsho/nvim-bufferline.lua",
  tag = "v2.7.0",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup{}
  end
}
