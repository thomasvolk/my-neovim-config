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
    {
      -- The GitHub repository for the codecompanion.nvim plugin.
      "olimorris/codecompanion.nvim",

      -- Specifies other plugins that codecompanion.nvim needs to function correctly.
      dependencies = {
        -- plenary.nvim provides common utility functions that are used by many Neovim plugins.
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("codecompanion").setup({
          strategies = {
            -- add copilot strategy
            -- The 'default' strategy is used for general code generation tasks.
            default = { provider = "copilot", model = "code-davinci-002" },
            -- The 'explain' strategy is used for code explanation tasks.
            explain = { provider = "copilot", model = "code-davinci-002" },
            -- The 'test' strategy is used for generating tests.
            test = { provider = "copilot", model = "code-davinci-002" },
            -- The 'refactor' strategy is used for code refactoring tasks.
            refactor = { provider = "copilot", model = "code-davinci-002" },
          },
        })
        vim.keymap.set('n', '<leader>cc', ':CodeCompanionChat<CR>', {})
      end,
    }
  }
