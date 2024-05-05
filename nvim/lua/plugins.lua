-- Lazy will be my plugin manager
-- see https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
   { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
 , { "nvim-tree/nvim-tree.lua",
     version = "*",
     lazy = false,
     dependencies = {
       "nvim-tree/nvim-web-devicons",
     }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

require('nvim-tree').setup()
