# neovim-config

This is my neovim configuration.

## Prerequisites

You have to have the following software installed

* Python3
* node
* git
* fd
* luarocks

Required for treesitter:

    npm install -g tree-sitter-cli

Start neovim and call `:Lazy` and `U` to install all treesitter parser.

Required for telescope:

* ripgrep
    ```
    brew install ripgrep
    ```

* git integration:
    ```
    brew install lazygit
    ```

Required language server:

* pylint
    `pip3 install python-lsp-server pylint`

* OCaml
    ```
    opam install ocamlformat-rpc ocamlformat ocaml-lsp-server
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

* Java
    ```
    brew install jdtls
    ```
* F# (ionide)
    ```
    brew install dotnet
    brew install dotnet-sdk
    dotnet tool install --global fsautocomplete
    export PATH="$PATH:$HOME/.dotnet/tools"
    ```

Required for MCPHub:

```
brew install uv
```

## Installation

Checkout the repo and link it to `$HOME/.config/nvim`:

    cd $HOME/.config/
    mv nvim nvim_bak
    git clone git@...my-neovim-config
    ln -s my-neovim-config/nvim nvim

### Environment variables

You can set the following environment variables to customize this configuration:

* `MY_NVIM_THEME` - Set the theme for neovim (`light`, `dark`). Default is `dark`.
* `MY_NVIM_AI` - Set the AI provider for neovim (`copilot`, `windsurf`). Default is `windsurf`.

## tmux

Install tmux:

    brew install tmux

Configure tmux:

    touch ~/.tmux.conf
    echo "setw -g mouse on\n" >> ~/.tmux.conf
    echo "set-option -g focus-events on\n" >> ~/.tmux.conf


## Alternative configs

Install AstroNvim to `.config/AstroNvim` and use the to switch to this profile:

    NVIM_APPNAME=AstroNvim nvim

## Help

```
<Leader> + ?             - help
:MyNeovimHelp            - help
```

see: [help.lua](nvim/lua/help.lua)
