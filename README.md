# neovim-config

This is my neovim configuration.

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
Ctrl + n                 - open NERDTree
<Leader> + nn            - toggle NERDTree
:Neotree close           - close NERDTree
```

Buffers:
```
<Leader> + bb            - list buffers
<Leader> + bd            - close buffers
:bd                      - close buffer
```

Autocomplete:
```
<Tab>                    - autocomplete
```

### tmux

Start tmux:

    tmux

Reattach to a session:

    tmux attach

Commands:
```
Ctrl + b, d               - detach session

Ctrl + b, %               - split vertically
Ctrl + b, "               - split horizontally
Ctrl + b, o               - switch panes
Ctrl + b, <Arrow>         - switch panes
Ctrl + b, Alt + <Arrow>   - resize panes
Ctrl + b, x               - close pane

Ctrl + b, c               - create new window
Ctrl + b, n               - next window
Ctrl + b, p               - previous window
Ctrl + b, w               - list windows
Ctrl + b, &               - close window
```
