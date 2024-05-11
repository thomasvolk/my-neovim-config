return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function ()
    ibl = require("ibl")
    ibl.setup({
      scope = { enabled = false }
    })
  end
}
