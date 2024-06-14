local function PrintHelp()
    print([[

-- nvim --

Help:

<Leader> + ?             - help
:MyNeovimHelp            - help

Files:

<Leader> + ff            - fuzzy find file
<Leader> + fg            - grep files
<Ctrl> + n                 - open NERDTree
<Leader> + nn            - toggle NERDTree
:Neotree close           - close NERDTree
<Leader> + tt            - open terminal
<Leader> + o             - open outline

Navigation:

gf                       - go to file
gx                       - open external link
gd                       - go to definition
gD                       - go to declaration
gi                       - go to implementation
<Ctrl> + i               - navigate forward
<Ctrl> + o               - navigate back

Buffers:

<Leader> + bb            - list buffers
<Leader> + bd            - close buffers
:bd                      - close buffer

Windows:

<Ctrl> + ww              - switch between windows
<Ctrl> + w<Arrow>        - navigate to another windows

Terminal:

<Ctrl> + x               - open terminal window

Editing:

<Tab>                    - autocomplete
gg=G                     - autoformat the whole file
<leader> + y             - yank motion
<leader> + Y             - yank line
<leader> + p             - paste after cursor
<leader> + P             - paste before cursor
"                        - select from registers
:reg                     - show registers
"<N>                     - use register N for the next delete, yank, or put
"+                       - use system clipboard register for the next delete, yank, or put
z=                       - see the spell check suggestions

lsp:

<leader> + r             - rename variable and all references

Macro:

q<N>                     - start recording for macro N
q                        - stop recording
@<N>                     - replay macro

Development:

:Telescope help_tags     - show interactive lua api help
:lua vim.notify 'Hello'  - display a hello notification on screen


-- tmux --

Start tmux:

    tmux

    tmux new -s session_name

List sessions:

    tmux ls

Reattach to a session:

    tmux attach
    
    tmux a -t session_name

Enable tmux mouse support:

    touch ~/.tmux.conf
    echo "setw -g mouse on" >> ~/.tmux.conf


Commands:

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

<Ctrl> + bs               - open session menue

         :kill-session    - kill selected session
         :new -t <name>   - new session

    ]])
end


vim.api.nvim_create_user_command('MyNeovimHelp', PrintHelp,
  {nargs = 0, desc = 'Print help'}
)
vim.keymap.set('n', '<Leader>?', ':MyNeovimHelp<CR>', {})
