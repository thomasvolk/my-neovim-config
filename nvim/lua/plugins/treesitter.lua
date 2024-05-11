
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "lua",
        "ocaml",
        "python",
        "javascript",
        "java",
        "bash",
        "xml",
        "yaml",
        "ocaml",
        "html",
        "css",
        "terraform"
      }
    })
  end
}
