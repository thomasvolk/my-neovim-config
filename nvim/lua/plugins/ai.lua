local ai = os.getenv("NVIM_EDITOR_AI")
if ai == nil then
  ai = os.getenv("EDITOR_AI")
end

local config = {}

if ai and string.lower(ai) == "copilot" then
  config = require("plugins/ai/copilot")
end

if ai and string.lower(ai) == "codeium" then
  config = require("plugins/ai/codeium")
end

if ai and string.lower(ai) == "ollama" then
  config = require("plugins/ai/ollama")
end

if ai and string.lower(ai) == "claude" then
  config = require("plugins/ai/claude")
end

return config
