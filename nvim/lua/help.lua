
function print_help() 
    print([[

-- nvim --

Files:

<Leader> + ff            - fuzzy find file
<Leader> + fg            - grep files
<Ctrl> + n                 - open NERDTree
<Leader> + nn            - toggle NERDTree
:Neotree close           - close NERDTree
<Leader> + tt            - open terminal


Buffers:

<Leader> + bb            - list buffers
<Leader> + bd            - close buffers
:bd                      - close buffer

Windows:
<Ctrl> + ww                - switch between windows
<Ctrl> + w<Arrow>          - navigate to another windows

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
    ]])
end


vim.api.nvim_create_user_command('MyHelp', print_help,
  {nargs = 0, desc = 'Print help'}
)
