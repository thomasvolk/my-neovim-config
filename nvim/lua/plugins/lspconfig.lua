return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    require('mason').setup({})
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup {
        ensure_installed = { "pylsp" },
        lua_ls = function()
          require('lspconfig').lua_ls.setup({})
        end
    }

    local lsp = require("lspconfig")

    -- shortcuts
    vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, {noremap = true})

    -- python-lsp

    lsp.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pylint = {
              enabled = true,
            },
            pycodestyle = { enabled = false }, -- Disable other linters if needed
          },
        },
      },
    })

    -- ocaml-lsp

    lsp.ocamllsp.setup({
      cmd = { "ocamllsp" },
      filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "opam", "reason", "dune" },
      root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
      capabilities = capabilities
    })

    -- terraform-lsp

    lsp.terraformls.setup({})


    -- lua lsp

    lsp.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },

    })


    -- elm

    lsp.elmls.setup( {
		  cmd = { "elm-language-server" },
		  filetypes = { "elm" },
		  init_options = {
			  elmAnalyseTrigger = "change",
			  elmFormatPath = "elm-format",
			  elmPath = "elm",
			  elmTestPath = "elm-test"
		  },
		  root_dir = lsp.util.root_pattern("elm.json")
	  })

    -- html

    lsp.html.setup({
      capabilities = capabilities,
      filetypes = { "html", "templ", "xhtml" },
    })

    -- css

    lsp.tailwindcss.setup({})

    -- bash

    lsp.bashls.setup({})

    -- make

    lsp.cmake.setup({})

  end
}
