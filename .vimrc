"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'       " required by fugitive to :Gbrowse
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'    " automatic closing of surroundings
Plug 'w0rp/ale'                " linter
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'    " syntax highlighting
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'      " 2-char search with s
Plug 'junegunn/vim-easy-align' " ga<action>
Plug 'lifepillar/vim-solarized8'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"" shell
set shell=/usr/bin/fish

"" Swapfile
set noswapfile

"" Encryption
set cryptmethod=blowfish2

"" Tabs
set shiftwidth=4
set tabstop=4

"" Edit new file without saving current buffer
set hidden

"" Searching
set hlsearch
set incsearch
" search case-sensitively only if it contains capital
set ignorecase
set smartcase

"" Mouse
set mouse=a

"" Move cursor by display lines when wrapping
noremap <silent> k gk
noremap <silent> j gj

"" Do not enter Ex-mode 
:map Q <Nop>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

"" Sneak
let g:sneak#s_next = 1

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

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nmap n nzzzv
nmap N Nzzzv

"*****************************************************************************
"" Commands
"*****************************************************************************

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" fugitive
nmap <leader>ga  :Gwrite<CR>
nmap <leader>gc  :Gcommit<CR>
nmap <leader>gsh :Gpush<CR>
nmap <leader>gll :Gpull<CR>
nmap <leader>gg  :Git<CR>
nmap <leader>gb  :Gblame<CR>
nmap <leader>gd  :Gvdiff<CR>
nmap <leader>gr  :Gremove<CR>
"" gitgutter
nmap <leader>gn  :GitGutterNextHunk<cr>
nmap <leader>gp  :GitGutterPrevHunk<cr>

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
nmap <leader>b\  :rightbelow vnew<CR>
nmap <leader>b-  :belowright new<CR>
nmap <leader>bw  :w<CR>
nmap <leader>bd  :bd<CR>
"" Go to the MRU buffer
nmap <leader><tab>  :e #<cr>

"" window
nmap <leader>w\  :<C-u>vsplit<CR><c-w>l
nmap <leader>w-  :<C-u>split<CR><c-w>j
nmap <leader>wq  :q<CR>
nmap <leader>w!  :q!<CR>

"" Tabpage
nmap <leader>tt  :tabnew<cr>
nmap <leader>th  :tabprevious<cr>
nmap <leader>tl  :tabnext<cr>
nmap <leader>t1  :tabfirst<cr>
nmap <leader>t9  :tablast<cr>

"" Marks
nmap <leader>m  :marks<CR>

"" Registers
nmap <leader>rr :reg<CR>

"" Terminal
nmap <leader><F12>  :terminal<CR>

"" FZF
" Files [PATH] 	Files (similar to :FZF)
nmap <leader>ff  :Files %:h<cr>
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
" Lines [QUERY] 	Lines in loaded buffers
" BLines [QUERY] 	Lines in the current buffer
nmap <leader>fl  :BLines<space>
" Marks 	Marks
" Locate PATTERN 	locate command output
" Snippets 	Snippets (UltiSnips)
" Commands 	Commands
" Maps 	Normal mode mappings
" Filetypes 	File types

