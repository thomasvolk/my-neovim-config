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

## Installation

Checkout the repo and link it to `$HOME/.config/nvim`:

    cd $HOME/.config/
    mv nvim nvim_bak
    git clone git@...my-neovim-config
    ln -s my-neovim-config/nvim nvim


## Shortcuts

### nvim

Help:
```
<Leader> + ?             - help
:MyNeovimHelp            - help
```


Files:
```
<Leader> + ff            - fuzzy find file
<Leader> + fg            - grep files
<Ctrl> + n                 - open NERDTree
<Leader> + nn            - toggle NERDTree
:Neotree close           - close NERDTree
<Leader> + tt            - open terminal
<Leader> + o             - open outline
```

Buffers:
```
<Leader> + bb            - list buffers
<Leader> + bd            - close buffers
:bd                      - close buffer
```

Windows:
```
<Ctrl> + ww              - switch between windows
<Ctrl> + w<Arrow>        - navigate to another windows
```

Editing:
```
<Tab>                    - autocomplete
gg=G                     - autoformat the whole file
```

Git:
```
:DiffviewOpen            - open divview
:DiffviewClose           - close divview
```

### tmux

Start tmux:

    tmux

... with name:

    tmux new -s session_name

Reattach to a session:

    tmux attach

... with name:

    tmux a -t session_name

List sessions:

    tmux ls

Commands:
```
<Ctrl> + bd               - detach session
<Ctrl> + b$               - rename session

<Ctrl> + b%               - split vertically
<Ctrl> + b"               - split horizontally
<Ctrl> + bo               - switch panes
<Ctrl> + b<Arrow>         - switch panes
<Ctrl> + b<Alt> + <Arrow>   - resize panes
<Ctrl> + bx               - close pane

<Ctrl> + bc               - create new window
<Ctrl> + bn               - next window
<Ctrl> + bp               - previous window
<Ctrl> + bw               - list windows
<Ctrl> + b&               - close window
```
