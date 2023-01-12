"*****************************************************************************
"" Behavior Settings
"*****************************************************************************"
let mapleader = "\<Space>"

set hlsearch
set ignorecase  "" Search case-sensitively
set smartcase   "" ... unless it contains capital.

let g:sneak#use_ic_scs = 1  "" Case insensitive sneak
let g:sneak#s_next = 1  "" Type ; to go to the next match (or s again)

set shell=fish
set mouse=a
set clipboard=unnamedplus  "" Share clipboard with X11
set hidden  "" Edit new file without saving current buffer
set cryptmethod=blowfish2

set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set undodir=~/.cache/vim/undo//

"" Do not enter Ex-mode
map Q <Nop>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
colorscheme gruvbox
set background=dark

"" Show trailing whitespaces
set list
set listchars=tab:>-,trail:-,eol:\ ,extends:>,precedes:<,nbsp:%

" set shiftwidth=4
" set tabstop=4
" set expandtab

"" Put '> \' at the start of wrapped line
set showbreak=>\ \ \

"" Show branch name in status bar
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P


"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Keep cursor centered
nmap n nzzzv
nmap N Nzzzv

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

"" Open an edit command with the path of the current file filled in
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

