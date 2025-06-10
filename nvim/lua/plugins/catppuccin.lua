
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local theme = os.getenv("MY_NVIM_THEME")
    if theme and string.lower(theme) == "light" then
      vim.cmd.colorscheme "catppuccin-latte"
    else
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  end
}
