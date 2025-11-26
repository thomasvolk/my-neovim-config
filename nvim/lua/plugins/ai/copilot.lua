return {
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
