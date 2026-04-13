local ai = os.getenv("NVIM_EDITOR_AI")
if ai == nil then
  ai = os.getenv("EDITOR_AI")
end

if ai == nil then
  return {}
end

local plugins = {
  copilot="plugins/ai/copilot",
  codeium="plugins/ai/codeium",
  ollama="plugins/ai/ollama",
  claude="plugins/ai/claude",
  gemini="plugins/ai/gemini",
  cursor="plugins/ai/cursor"
}

local function get_plugin(name)
  local plugin = plugins[name]
  if plugin == nil then
    error("Unknown AI plugin: " .. name)
  end
  if string.find(ai, name) ~= nil then
     return require(plugin)
  end
  return {}
end

return {
  get_plugin("copilot"),
  get_plugin("codeium"),
  get_plugin("ollama"),
  get_plugin("claude"),
  get_plugin("gemini"),
  get_plugin("cursor")
}
