
-- subtext navigation module
-- https://github.com/subconsciousnetwork/subtext/

local P_NOTE_REF = [[^/[A-Za-z0-9_%-]+$]]
local P_WIKI_LINK = [[[^A-Za-z0-9_%- ]+]]

local jump_to_note = function ()
  local noteName = vim.fn.expand("<cfile>")
  if string.find(noteName, P_NOTE_REF) then
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
        local filtered_link = string.lower(string.gsub(link, P_WIKI_LINK, ""))
        local path = "./" .. string.gsub(filtered_link, "[ ]+", "-") .. ".subtext"
        vim.cmd("e " .. path)
      end
    end
  end
end

local highlight = function(name, pattern, color)
  vim.cmd.syntax([[match ]] .. name ..  [[ "]] .. pattern .. [["]])
  vim.cmd.highlight(name .. [[ guifg=]] .. color .. [[ gui=bold ]])
end


vim.api.nvim_create_autocmd({"TextChanged", "BufEnter", "BufWinEnter"}, {
    pattern = "*.subtext",
    callback = function()
        local C_HEADING = "#EEEE88"
        local C_FILE = "#88EE88"
        local C_URL = C_FILE
        local C_REF = "#88EEEE"
        local C_LINK = C_REF
        local C_FIELD = "#8888FF"

        highlight("SubtextHeading", [[\v^#.+$]], C_HEADING)

        highlight("SubtextUrl", [[\v(^|\s)https?://[/\-a-zA-Z0-9@:%._\+~#=\.]+($|\s)"]], C_URL)

        highlight("SubtextRef", [[\v(^|\s)/[a-zA-Z0-9\-_/]+($|\s)"]], C_REF)

        highlight("SubtextWikiLink", [[\v\[\[.{-}\]\]+"]], C_LINK)

        highlight("SubtextFile", [[\v(^|\s)/[a-zA-Z0-9\-_/]+\.[a-zA-Z0-9\-_/]+($|\s)"]], C_FILE)

        highlight("SubtextFields", [[\v^:(created-at|updated-at|neno-flags|alias-of)+:"]], C_FIELD)

        vim.keymap.set('n', '<leader><CR>', function() jump_to_note() end, {noremap = true})

        vim.api.nvim_create_user_command('SubtextJump', jump_to_note,
          {nargs = 0, desc = 'follow subtext reference'}
        )
    end
})
