
local jump_to_note = function ()
  local noteName = vim.fn.expand("<cfile>")
  if string.find(noteName, "^/[%w-]+") then
    local path = "." .. noteName .. ".subtext"
    vim.cmd("e " .. path)
  end
end


vim.api.nvim_create_autocmd({"TextChanged", "BufEnter", "BufWinEnter"}, {
    pattern = "*.subtext",
    callback = function()
        vim.cmd.syntax([[match SubtextHeading "\v^#.+$"]])
        vim.cmd.highlight([[SubtextHeading guifg=#8888FF gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match SubtextUrl "\vhttps?://[/\-a-zA-Z0-9@:%._\+~#=\.]+($|\s)"]])
        vim.cmd.highlight([[SubtextUrl guifg=#EE8888 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match SubtextRef "\v(^|\s)/[a-zA-Z0-9\-_/]+($|\s)"]])
        vim.cmd.highlight([[SubtextRef guifg=#88EE88 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match NenoRef "\v\[\[[0-9A-Za-z_\- ]+\]\]+"]])
        vim.cmd.highlight([[NenoRef guifg=#88EE88 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match NenoFile "\v(^|\s)/[a-zA-Z0-9\-_/\.]+($|\s)"]])
        vim.cmd.highlight([[NenoFile guifg=#88EEEE gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match NenoFields "\v^:(created-at|updated-at|neno-flags)+:"]])
        vim.cmd.highlight([[NenoFields guifg=#EEEE88 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])

        vim.keymap.set('n', '<leader><CR>', function() jump_to_note() end, {noremap = true})

        vim.api.nvim_create_user_command('NenoJump', jump_to_note,
          {nargs = 0, desc = 'Nono reference jump'}
        )
    end
})
