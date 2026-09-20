return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_startup_folded = 'showall',
    })
    vim.lsp.enable('org') -- experimental

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'org',
      callback = function()
        vim.opt_local.foldenable = false
      end,
    })
  end,
}
