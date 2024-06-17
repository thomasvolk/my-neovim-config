-- subtext cmp source module
-- https://github.com/subconsciousnetwork/subtext/

local FILE_SEP = package.config:sub(1, 1)


local function map(tbl, f)
  local r = {}
  for k, x in pairs(tbl) do
    r[k] = f(x)
  end
  return r
end


local function get_name(path)
    return path:match("^.+" .. FILE_SEP .. "(.+)%.subtext$")
end


local function list_subtext_files()
    local cwd = vim.fn.getcwd()
    local files = vim.fn.glob(cwd .. '/**/*.subtext', true, true)
    return map(files, get_name)
end


local source = {}

source.new = function()
  local self = setmetatable({}, { __index = source })
  return self
end

function source:complete(request, callback)
  local items = {}
  local line = request.context.cursor_before_line
  if string.sub(line, -1) == "/" or string.sub(line, -2) == "[[" or line == ":alias-of:" then
    local notes = list_subtext_files()
    for _, note in ipairs(notes) do
      table.insert(items, { label = note, kind = require('cmp.types').lsp.CompletionItemKind.Reference })
    end
  end
  callback({ items = items })
end

return source
