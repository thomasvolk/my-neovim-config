return {
    {
      "ravitemer/mcphub.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
      build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
      config = function()
          require("mcphub").setup({})
      end
    },
    {
      "nomnivore/ollama.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },

      -- All the user commands added by the plugin
      cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

      keys = {
        -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
        {
          "<leader>oo",
          ":<c-u>lua require('ollama').prompt()<cr>",
          desc = "ollama prompt",
          mode = { "n", "v" },
        },

        -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
        {
          "<leader>oG",
          ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
          desc = "ollama Generate Code",
          mode = { "n", "v" },
        },
      },

      opts = {
        -- your configuration overrides
      }
    },
    {
      -- The GitHub repository for the codecompanion.nvim plugin.
      "olimorris/codecompanion.nvim",
      branch = 'v18',

      -- Specifies other plugins that codecompanion.nvim needs to function correctly.
      dependencies = {
        -- plenary.nvim provides common utility functions that are used by many Neovim plugins.
        "nvim-lua/plenary.nvim",
      },
      opts = {
			  log_level = "DEBUG",
			},
      config = function()
        require("codecompanion").setup({
          strategies = {
            -- Configures the default model for running custom prompts.
            cmd = {
              adapter = "ollama",
              model = "qwen2.5",
            },

            -- Configures the model for the interactive chat window (:CompanionChat).
            chat = {
              adapter = "ollama",
              model = "qwen2.5",
              tools = {
                ["mcp"] = {
                  callback = function()
                    return require("mcphub.extensions.codecompanion")
                  end,
                  description = "Call tools and resources from the MCP Servers",
                  opts = {
                    requires_approval = true,
                  },
                },
              },
            },

            -- Configures the model for any action that modifies code directly in your buffer
            -- using the 'inline' strategy.
            inline = {
              adapter = "ollama",
              model = "qwen2.5",
            },
          },
        })
        vim.keymap.set('n', '<leader>cc', ':CodeCompanionChat<CR>', {})
      end,

    }
}
