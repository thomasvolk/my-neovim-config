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

## Installation

Checkout the repo and link it to `$HOME/.config/nvim`:

    cd $HOME/.config/
    mv nvim nvim_bak
    git clone git@...my-neovim-config
    ln -s my-neovim-config/nvim nvim


## Shortcuts

### nvim

Files:
```
<Leader> + ff            - fuzzy find file
<Leader> + fg            - grep files
<Ctrl> + n                 - open NERDTree
<Leader> + nn            - toggle NERDTree
:Neotree close           - close NERDTree
<Leader> + tt            - open terminal
```

Buffers:
```
<Leader> + bb            - list buffers
<Leader> + bd            - close buffers
:bd                      - close buffer
```

Windows:
```
<Ctrl> + ww                - switch between windows
<Ctrl> + w<Arrow>          - navigate to another windows
```

Autocomplete:
```
<Tab>                    - autocomplete
```

Git:
```
:DiffviewOpen            - open divview
:DiffviewClose           - close divview
```

### tmux

Start tmux:

    tmux

Reattach to a session:

    tmux attach

Commands:
```
<Ctrl> + bd               - detach session

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
