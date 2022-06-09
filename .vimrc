"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'        " required by fugitive to :Gbrowse
Plug 'airblade/vim-gitgutter'
Plug 'aymericbeaumet/vim-symlink' " follow symlink (fugitive works only in git repo)
Plug 'moll/vim-bbye'            " optional dependency of vim-symlink

""Beauty
Plug 'w0rp/ale'                 " linter
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'     " syntax highlighting
Plug 'Raimondi/delimitMate'     " automatic closing of surroundings
Plug 'lifepillar/vim-solarized8'

" Finger friendliness
Plug 'chiel92/vim-autoformat'   " code formatting
Plug 'justinmk/vim-sneak'       " 2-char search with s
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'  " ga<action>

" Languages
Plug 'kovisoft/slimv'

call plug#end()

"*****************************************************************************
"" Behavior Settings
"*****************************************************************************"

"" Share clipboard with X11
set clipboard=unnamedplus

"" shell
set shell=~/.guix-profile/bin/fish

"" Tabs
set shiftwidth=4
set tabstop=4
set expandtab

"" Edit new file without saving current buffer
set hidden

"" Searching
set hlsearch
set incsearch
"" Search case-sensitively if it contains capital.
set ignorecase
set smartcase
let g:sneak#use_ic_scs = 1

"" Do not enter Ex-mode 
:map Q <Nop>

"" Swapfile
set noswapfile

"" Encryption
set cryptmethod=blowfish2

"" Map leader to
let mapleader = "\<Space>"

"" Sneak
let g:sneak#s_next = 1


"*****************************************************************************
"" Visual Settings
"*****************************************************************************

"" Show trailing whitespaces
set list
set listchars+=tab:>-,trail:◦,eol:\ 

"" Put '> \' at the start of wrapped line
set showbreak=>\ \ \

"" Sometimes setting 'termguicolors' is not enough and one has to set the |t_8f| and |t_8b| options explicitly.
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"" Color
colorscheme solarized8

"" Background color based on tiem of day
if 6 < strftime("%H") && strftime("%H") < 18
  set background=light
else
  set background=dark
endif

"" Line number
set number

"" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

"" Always show status bar
set laststatus=2

"" Show branch name in status bar 
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P


"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Keep cursor centered
nmap n nzzzv
nmap N Nzzzv

"" Replace selection with random hex
function! Randdec(len)
    let seed = srand()
    return range(a:len)->map({-> rand(seed) % 10})->map({_,n->printf('%d', n)})->join('')
endfunction
function! Randhex(len)
    let seed = srand()
    return range(a:len)->map({-> rand(seed) % 16})->map({_,n->printf('%x', n)})->join('')
endfunction
vmap <leader>rd c<C-R>=Randdec(len(@*))<CR><Esc>
vmap <leader>rh c<C-R>=Randhex(len(@*))<CR><Esc>

"" Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" fugitive
nmap <leader>gg  :Git<CR>
nmap <leader>gb  :Git branch<CR>
nmap <expr> <leader>gl @% =~# '.git/index$' ? ':Gclog<CR>' : ':Gclog -- %<CR>'
nmap <leader>gw  :Gwrite<CR>
nmap <leader>gc  :Git commit<CR>
nmap <leader>gsh :Git push<CR>
nmap <leader>gll :Git pull<CR>
" nmap <leader>gb  :Git blame<CR>
nmap <leader>gd  :Git vdiff<CR>
nmap <leader>gr  :Gremove<CR>
nmap <leader>h]  :GitGutterNextHunk<CR>
nmap <leader>h[  :GitGutterPrevHunk<CR>

"" Highlight
nmap <Esc><Esc> :noh<CR>

"" Resize
let n=10
nmap <silent> <leader>rh :exe "vertical resize -" . n<CR>
nmap <silent> <leader>rj :exe "resize +" . n<CR>
nmap <silent> <leader>rk :exe "resize -" . n<CR>
nmap <silent> <leader>rl :exe "vertical resize +" . n<CR>

"" netrw
nmap <silent> <F3> :Explore<CR>
nmap <silent> <F4> :Vexplore<CR>

"" Set working directory
nmap <leader>. :cd %:h<CR>

"" Open an edit command with the path of the currently edited file filled in
nmap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Search for visually selected text
vmap // y/<C-R>0<CR>

"" Buffer
nmap <leader>ww  :w<CR>
nmap <leader>wq  :wq<CR>
nmap <leader>bd  :bd<CR>
"" Go to the MRU buffer
nmap <leader><tab>  :e #<cr>

"" window
nmap <leader>q  :q<CR>
nmap <leader>!  :q!<CR>
nmap <leader>on :on<CR>

"" Marks
nmap <leader>m  :marks<CR>
"" Registers
nmap <leader>rr :reg<CR>

"" Terminal
nmap <leader>``  :terminal<CR>
nmap <leader>`v  :vert ter<CR>

"" FZF
" Files [PATH] 	Files (similar to :FZF)
nmap <leader>ff  :Files %:p:h<cr>
" History 	    v:oldfiles and open buffers
nmap <leader>fh  :History<CR>
" `History:` 	Command history
nmap <leader>fc  :History:<CR>
" History/ 	Search history
" Buffers 	    Open buffers
nmap <leader>fb  :Buffers<CR>
" GFiles [OPTS] 	Git files (git ls-files)
" GFiles? 	Git files (git status)
" Commits 	Git commits (requires fugitive.vim)
" BCommits 	Git commits for the current buffer
" Ag [PATTERN] 	ag search result (ALT-A to select all, ALT-D to deselect all)
" Rg [PATTERN] 	rg search result (ALT-A to select all, ALT-D to deselect all)
nmap <leader>fr  :Rg<space>
" Lines [QUERY] 	Lines in loaded buffers
" BLines [QUERY] 	Lines in the current buffer
nmap <leader>fl  :BLines<space>
" Marks 	Marks
" Locate PATTERN 	locate command output
" Snippets 	Snippets (UltiSnips)
" Commands 	Commands
" Maps 	Normal mode mappings
" Filetypes 	File types

