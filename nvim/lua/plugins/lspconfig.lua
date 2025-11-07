return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-jdtls"
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local lspconfig = require('lspconfig')

    require('mason').setup({})
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup {
        ensure_installed = { "pylsp" },
        lua_ls = function()
          vim.lsp.config.lua_ls.setup({})
        end
    }

    -- shortcuts
    vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, {noremap = true})

    -- python-lsp
    -- check if the project directory includes a pylintrc file
    local cwd = vim.fn.getcwd()
    local pylintrc = vim.fn.glob(cwd .. "/.pylintrc")
    local has_pylintrc = pylintrc ~= ""
    local args = {}

    if has_pylintrc then
      vim.notify("Using pylintrc file: " .. pylintrc)
      args = { "--rcfile", pylintrc }
    end

    vim.lsp.config('pylsp', {
      settings = {
        pylsp = {
          plugins = {
            pylint = {
              args = args,
              enabled = true,
            },
            pycodestyle = { enabled = false }, -- Disable other linters if needed
          },
        },
      },
    })

    -- java-lsp

    vim.lsp.config('jdtls', {
      cmd = { "jdtls" },
      filetypes = { "java" },
      root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
      capabilities = capabilities,
    })

    -- ocaml-lsp

    vim.lsp.config('ocamllsp', {
      cmd = { "ocamllsp" },
      filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "opam", "reason", "dune" },
      root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
      capabilities = capabilities
    })

    -- terraform-lsp

    vim.lsp.config('terraformls', {})


    -- lua lsp

    vim.lsp.config('lua_ls', {
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

    vim.lsp.config('elmls',  {
		  cmd = { "elm-language-server" },
		  filetypes = { "elm" },
		  init_options = {
			  elmAnalyseTrigger = "change",
			  elmFormatPath = "elm-format",
			  elmPath = "elm",
			  elmTestPath = "elm-test"
		  },
      root_dir = lspconfig.util.root_pattern("elm.json")
	  })

    -- html

    vim.lsp.config('html', {
      capabilities = capabilities,
      filetypes = { "html", "templ", "xhtml" },
    })

    -- css

    vim.lsp.config('tailwindcss', {})

    -- bash

    vim.lsp.config('bashls', {})

    -- make

    vim.lsp.config('cmake', {})

  end
}
