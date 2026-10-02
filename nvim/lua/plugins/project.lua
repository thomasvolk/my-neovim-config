return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/projects/*",
    },
    picker = {
      type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
    }
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    vim.keymap.set('n', '<leader>p', ':NeovimProjectDiscover history<CR>')
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker
    { "nvim-telescope/telescope.nvim" },
    -- optional picker
    { "ibhagwan/fzf-lua" },
    -- optional picker
    { "folke/snacks.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
