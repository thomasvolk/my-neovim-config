
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    config = require("nvim-treesitter")
    config.setup({})
    config.install(
      {
        "lua",
        "ocaml",
        "python",
        "javascript",
        "java",
        "bash",
        "xml",
        "yaml",
        "html",
        "css",
        "terraform",
        "markdown",
        "markdown_inline"
      }
    )
  end
}
