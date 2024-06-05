
-- subtext navigation module
-- https://github.com/subconsciousnetwork/subtext/

local jump_to_note = function ()
  local noteName = vim.fn.expand("<cfile>")
  if string.find(noteName, "^/[%w-]+") then
    local path = "." .. noteName .. ".subtext"
    vim.cmd("e " .. path)
  else
    local column = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local right = string.sub(line, column + 1, string.len(line))
    local left = string.sub(line, 0, column)
    local r_wiki_bracket = string.find(right, "%]%]")
    if r_wiki_bracket then
      local l_wiki_bracket = string.find( (left):reverse(), "%[%[")
      if l_wiki_bracket then
        local e = column + r_wiki_bracket - 1
        local s = column - l_wiki_bracket + 2
        local link = string.sub(line, s, e)
        vim.notify(link)
      end
    end


    -- vim.notify(left .. "|-----|" .. right)
  end
end


vim.api.nvim_create_autocmd({"TextChanged", "BufEnter", "BufWinEnter"}, {
    pattern = "*.subtext",
    callback = function()
        vim.cmd.syntax([[match SubtextHeading "\v^#.+$"]])
        vim.cmd.highlight([[SubtextHeading guifg=#8888FF gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match SubtextUrl "\v(^|\s)https?://[/\-a-zA-Z0-9@:%._\+~#=\.]+($|\s)"]])
        vim.cmd.highlight([[SubtextUrl guifg=#EE8888 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])
        vim.cmd.syntax([[match SubtextRef "\v(^|\s)/[a-zA-Z0-9\-_/]+($|\s)"]])
        vim.cmd.highlight([[SubtextRef guifg=#88EE88 gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen]])

        vim.keymap.set('n', '<leader><CR>', function() jump_to_note() end, {noremap = true})

        vim.api.nvim_create_user_command('SubtextJump', jump_to_note,
          {nargs = 0, desc = 'follow subtext reference'}
        )
    end
})
