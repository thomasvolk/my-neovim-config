local function PrintHelp()
    print([[

-- nvim --

Help:

Leader                      Space
Localleader                 | 

Commands:

<Leader> + ?                 - help
:MyNeovimHelp                - help

Files:

<Ctrl> + n                   - open NERDTree
<Leader> + nn                - toggle NERDTree
:Neotree close               - close NERDTree
<Leader> + o                 - open outline

Telescope:

<Leader> + ff                - fuzzy find file
<Leader> + fg                - grep files

Search and replace:


s/SEARCH/REPLACE/g           - search and replace in a single line
%s/SEARCH/REPLACE/g          - search and replace in the buffer


    Within the Telescope view:

        <Ctrl>   + q                         - create a quickfix list
        :cfdo s/SEARCH/REPL/g                - search and replace project wide
        :cfdo s/SEARCH/REPL/g | update       - same as above but save the changes directly


<Leader> + sr                - open Groug Far search and replace
<Localleader> + r            - Replace all

Navigation:

gf                           - go to file
gx                           - open external link
gd                           - go to definition
gD                           - go to declaration
gt                           - go to type definition
gi                           - go to implementation
<Ctrl> + i                   - navigate forward
<Ctrl> + o                   - navigate back

Buffers:

<Leader> + bb                - list buffers
<Leader> + bd                - close buffers
:bd                          - close buffer

Windows:

<Ctrl> + ww                  - switch between windows
<Ctrl> + w<Arrow>            - navigate to another windows
<Ctrl> + ws                  - split horizontally
<Ctrl> + wv                  - split vertically
<Ctrl> + wq                  - close window

Terminal:

<Ctrl> + x                   - open terminal window

Editing:

<Tab>                        - autocomplete
gg=G                         - autoformat the whole file
<leader> + y                 - yank motion
<leader> + Y                 - yank line
<leader> + p                 - paste after cursor
<leader> + P                 - paste before cursor
"                            - select from registers
:reg                         - show registers
"<N>                         - use register N for the next delete, yank, or put
"+                           - use system clipboard register for the next delete, yank, or put
z=                           - see the spell check suggestions

Search/Replace:

:s/foo/bar/g                 - replace foo with bar in the current line
:%s/foo/bar/g                - replace foo with bar in the whole file
:s/Foo/bar/gi                - replace foo with bar case insensitive

lsp:

<leader> + r                 - rename variable and all references

Macro:

q<N>                         - start recording for macro N
q                            - stop recording
@<N>                         - replay macro

AI:

F2                           - accept suggestion
F3                           - enable AI support
F4                           - disable AI support
:Copilot disable             - disable Copilot
:Copilot enable              - enable Copilot
:Codeium Toggle              - enable/disable Codeium (Windsurf plugin)
:MCPHub                      - open mcp hub
:CopilotChat                 - open Copilot Chat

nvim Development:

:Telescope help_tags         - show interactive lua api help
:lua vim.notify 'Hello'      - display a hello notification on screen

Git:

<Leader> + lg                - opens lazygit
:G                           - open fugitive
    s                        - stage changes
    u                        - unstage changes
    cc                       - create commit
:Git push                    - push changes
:Git log                     - show git log
:Git blame                   - show git blame
:Git diff                    - show git diff
:GV                          - open git browser


Emoticons:

  ¯\_(ツ)_/¯

    ]])
end


vim.api.nvim_create_user_command('MyNeovimHelp', PrintHelp,
  {nargs = 0, desc = 'Print help'}
)
vim.keymap.set('n', '<F10>', ':MyNeovimHelp<CR>', {})
vim.keymap.set('n', '<Leader>h', ':MyNeovimHelp<CR>', {})
