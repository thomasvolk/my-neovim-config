-- subtext cmp source module
-- https://github.com/subconsciousnetwork/subtext/


local function map(tbl, f)
  local r = {}
  for k, x in pairs(tbl) do
    r[k] = f(x)
  end
  return r
end


local function list_subtext_files(root)
    local function get_name(path)
        local rel_path = string.sub(path, #root + 2)
        return rel_path:match("(.+)%.subtext$")
    end

    local files = vim.fn.glob(root .. '/**/*.subtext', true, true)
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
  if line == ":alias-of:" or
     string.sub(line, -1) == "/" or
     string.sub(line, -2) == "./" or
     string.sub(line, -2) == "[["
  then
    local root = vim.fn.getcwd()
    if string.sub(line, -2) == "./" then
      root = vim.fn.expand("%:p:h")
    end
    local notes = list_subtext_files(root)
    for _, note in ipairs(notes) do
      table.insert(items, { label = note, kind = require('cmp.types').lsp.CompletionItemKind.Reference })
    end
  end
  callback({ items = items })
end

return source
