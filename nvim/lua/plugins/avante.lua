return {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
    build = "make",
    opts = { provider = "copilot" },
    config = function()
      require("avante").setup({
          -- system_prompt as function ensures LLM always has latest MCP server state
          -- This is evaluated for every message, even in existing chats
          system_prompt = function()
              local hub = require("mcphub").get_hub_instance()
              return hub and hub:get_active_servers_prompt() or ""
          end,
          -- Using function prevents requiring mcphub before it's loaded
          custom_tools = function()
              return {
                  require("mcphub.extensions.avante").mcp_tool(),
              }
          end,
      })
    end
  }
