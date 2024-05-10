
function print_help() 
    print([[

-- nvim --

Files:

<Leader> + ff            - fuzzy find file
<Leader> + fg            - grep files
Ctrl + n                 - open NERDTree
<Leader> + nn            - toggle NERDTree
:Neotree close           - close NERDTree
<Leader> + tt            - open terminal


Buffers:

<Leader> + bb            - list buffers
<Leader> + bd            - close buffers
:bd                      - close buffer

Git:

:DiffviewOpen            - open divview
:DiffviewClose           - close divview


Autocomplete:

<Tab>                    - autocomplete

-- tmux --

Start tmux:

    tmux

Reattach to a session:

    tmux attach

Commands:

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
    ]])
end


vim.api.nvim_create_user_command('MyHelp', print_help,
  {nargs = 0, desc = 'Print help'}
)
