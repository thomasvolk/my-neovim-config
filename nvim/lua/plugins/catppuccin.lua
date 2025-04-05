
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local theme = os.getenv("CONSOLE_THEME")
    if theme and string.lower(theme) == "dark" then
      vim.cmd.colorscheme "catppuccin-frappe"
    else
      vim.cmd.colorscheme "catppuccin-latte"
    end
  end
}
