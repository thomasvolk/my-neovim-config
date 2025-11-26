return {
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

    -- Specifies other plugins that codecompanion.nvim needs to function correctly.
    dependencies = {
      -- plenary.nvim provides common utility functions that are used by many Neovim plugins.
      "nvim-lua/plenary.nvim",
    },

    -- The 'opts' table contains all the user-specific settings for the plugin.
    opts = {
      -- This 'strategies' table sets the DEFAULT AI PROVIDER and MODEL
      -- for different categories of actions within the plugin.
      strategies = {
        -- Configures the default model for running custom prompts.
        cmd = {
          adapter = "ollama",
          model = "llama3.1",
        },

        -- Configures the model for the interactive chat window (:CompanionChat).
        chat = {
          adapter = "ollama",
          model = "llama3.1",
        },

        -- Configures the model for any action that modifies code directly in your buffer
        -- using the 'inline' strategy.
        inline = {
          adapter = "ollama",
          model = "llama3.1",
        },
      },
    },
  }
}
