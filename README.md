# neovim-config

This is my neovim configuration.

## Prerequisites

You have to have the following software installed

* Python3
* node
* git

Required for telescope:

* ripgrep
    ```
    brew install ripgrep
    ```

Required language server:

* pyright
    `pip3 install pyright`

* OCaml
    ```
    opam install ocamlformat-rpc
    opam install ocamlformat
    opam install ocaml-lsp-server
    ```
* Terraform
    ```
    brew install hashicorp/tap/terraform-ls
    ```

* HTML
    ```
    npm i -g vscode-langservers-extracted
    ```

* bash
    ```
    npm i -g bash-language-server
    ```

* lua

    ```
    brew install lua-language-server
    ```

## Installation

Checkout the repo and link it to `$HOME/.config/nvim`:

    cd $HOME/.config/
    mv nvim nvim_bak
    git clone git@...my-neovim-config
    ln -s my-neovim-config/nvim nvim

## Alternative configs

Install AstroNvim to `.config/AstroNvim` and use the to switch to this profile:

    NVIM_APPNAME=AstroNvim nvim

## Help

```
<Leader> + ?             - help
:MyNeovimHelp            - help
```

see: [help.lua](nvim/lua/help.lua)
