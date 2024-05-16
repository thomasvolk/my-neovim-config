return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local lsp_zero = require('lsp-zero')
    lsp_zero.on_attach(function(_, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require('mason').setup({})
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup {
        ensure_installed = { "pyright" },
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end
    }

    local lsp = require("lspconfig")

    -- python-lsp

    lsp.pyright.setup {
        capabilities = capabilities,
    }

    -- ocaml-lsp

    local ocaml_on_attach = function(client, bufnr)
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      -- code lens 
      if client.resolved_capabilities.code_lens then
          local codelens = vim.api.nvim_create_augroup(
              'LSPCodeLens',
              { clear = true }
          )
          vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
              group = codelens,
              callback = function()
                  vim.lsp.codelens.refresh()
              end,
              buffer = bufnr,
          })
      end
    end

    lsp.ocamllsp.setup({
      cmd = { "ocamllsp" },
      filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "opam", "reason", "dune" },
      root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
      on_attach = ocaml_on_attach,
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
