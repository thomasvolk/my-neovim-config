
-- neno navigation module
-- https://github.com/polyrainbow/neno/

require("subtext")

vim.api.nvim_create_autocmd({"TextChanged", "BufEnter", "BufWinEnter"}, {
    pattern = "*.subtext",
    callback = function()
        vim.cmd.syntax([[match NenoRef "\v\[\[.{-}\]\]+"]])
        vim.cmd.highlight([[NenoRef guifg=#88EE88 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match NenoFile "\v(^|\s)/[a-zA-Z0-9\-_/\.]+($|\s)"]])
        vim.cmd.highlight([[NenoFile guifg=#88EEEE gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match NenoFields "\v^:(created-at|updated-at|neno-flags|alias-of)+:"]])
        vim.cmd.highlight([[NenoFields guifg=#EEEE88 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
    end
})
