
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    if os.getenv("NVIM_THEME") == "dark" then
      vim.cmd.colorscheme "catppuccin-frappe"
    else
      vim.cmd.colorscheme "catppuccin-latte"
    end
  end
}
