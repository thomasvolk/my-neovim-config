local ai = os.getenv("NVIM_EDITOR_AI")
if ai == nil then
  ai = os.getenv("EDITOR_AI")
end

local config = {}

if ai and string.lower(ai) == "copilot" then
  config = {
    {
      "ravitemer/mcphub.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
      build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
      config = function()
          require("mcphub").setup({
            extensions = {
              copilotchat = {
                enabled = true,
                convert_tools_to_functions = true,
                convert_resources_to_functions = true,
                add_mcp_prefix = false,
              },
            }
          })
      end
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
              accept = "<F2>"
            }
          },
          filetypes = {
            markdown = true,
            lua = true,
            python = true,
            javascript = true,
            typescript = true,
            java = true,
            go = true,
            terraform = true,
            ocaml = true,
            bash = true,
            ["*"] = true,

          },
        })
        vim.keymap.set('n', '<F3>', ':Copilot enable<CR>', {})
        vim.keymap.set('n', '<F4>', ':Copilot disable<CR>', {})
      end
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      opts = {
        -- See Configuration section for options
      },
    },
  }
end

if ai and string.lower(ai) == "codeium" then
  config = {
    'Exafunction/windsurf.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<F2>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('n', '<F3>', ":Codeium Enable<CR>", {})
      vim.keymap.set('n', '<F4>', ":Codeium Disable<CR>", {})
      -- disable codeium by default
      vim.g.codeium_enabled = false
    end
  }
end

return config
