return { 
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    require('mason').setup()
    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
        ensure_installed = { "pyright" }
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
      filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "opam", "reason", "dune", "yaml", "terraform" },
      root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
      on_attach = ocaml_on_attach,
      capabilities = capabilities
    })

    -- terraform-lsp

    lsp.terraformls.setup({})
  end
}
