"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale' " linter
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot' " syntax highlighting
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'

call plug#end()

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" ale
let g:ale_linters = {}

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"" Swapfile
set noswapfile

"" Encryption
set cryptmethod=blowfish2

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to
let mapleader = "\<Space>"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
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

"" Disable the blinking cursor.
set gcr=a:blinkon0

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
"" Autocmd Rules
"*****************************************************************************

" "" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
" augroup vimrc-sync-fromstart
"   autocmd!
"   autocmd BufEnter * :syntax sync maxlines=200
" augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

" grep.vim
map <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" Git
nmap <Leader>ga  :Gwrite<CR>
nmap <Leader>gc  :Gcommit<CR>
nmap <Leader>gsh :Gpush<CR>
nmap <Leader>gll :Gpull<CR>
nmap <Leader>gs  :Gstatus<CR>
nmap <Leader>gb  :Gblame<CR>
nmap <Leader>gd  :Gvdiff<CR>
nmap <Leader>gr  :Gremove<CR>
"" Open current line on GitHub
nmap <Leader>o :.Gbrowse<CR>

"" Copy to clipboard
"xmap y y:call system("wl-copy", @")<cr>

"" Highlight
nmap <Esc><Esc> :noh<CR>

"" Resize
let n=10
nmap <silent> <Leader>rh :exe "vertical resize -" . n<CR>
nmap <silent> <Leader>rj :exe "resize +" . n<CR>
nmap <silent> <Leader>rk :exe "resize -" . n<CR>
nmap <silent> <Leader>rl :exe "vertical resize +" . n<CR>

"" netrw
nmap <silent> <F3> :Explore<CR>
nmap <silent> <F4> :Vexplore<CR>

"" Set working directory
nmap <leader>. :cd %:h<CR>

"" Open an edit command with the path of the currently edited file filled in
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Search for visually selected text
vnoremap // y/<C-R>0<CR>

"" Buffer
nmap <leader>b\  :rightbelow vnew<CR>
nmap <leader>b-  :belowright new<CR>
nmap <leader>bp  :bp<CR>
nmap <leader>bn  :bn<CR>
nmap <leader>bd  :bd<CR>
nmap <leader>ww  :w<CR>
nmap <leader>wq  :wq<CR>
"" go to the MRU buffer
nmap <leader><tab>  :e #<cr>

"" Window
nmap <leader>w\ :<C-u>vsplit<CR><c-w>l
nmap <leader>w- :<C-u>split<CR><c-w>j
nmap <Leader>wh <c-w>h
nmap <Leader>wj <c-w>j
nmap <Leader>wk <c-w>k
nmap <Leader>wl <c-w>l
nmap <leader>q :q<CR>
nmap <leader>! :q!<CR>

"" Tabpage
nmap <leader>tt :tabnew<cr>
nmap <leader>th :tabprevious<cr>
nmap <leader>tl :tabnext<cr>
nmap <leader>t1 :tabfirst<cr>
nmap <leader>t9 :tablast<cr>

"" Marks
nmap <Leader>m :marks<CR>

"" Registers
nmap <Leader>rr :reg<CR>

"" Terminal
nmap <Leader>t :terminal<CR>

"" FZF
" Files [PATH] 	Files (similar to :FZF)
nmap <Leader>ff :Files %:h<cr>
" History 	    v:oldfiles and open buffers
nmap <leader>fr :History<CR>
" `History:` 	Command history
nmap <leader>fc :History:<CR>
" Buffers 	    Open buffers
nmap <leader>fb :Buffers<CR>
" GFiles [OPTS] 	Git files (git ls-files)
" GFiles? 	Git files (git status)
" Commits 	Git commits (requires fugitive.vim)
" BCommits 	Git commits for the current buffer
" Ag [PATTERN] 	ag search result (ALT-A to select all, ALT-D to deselect all)
" Rg [PATTERN] 	rg search result (ALT-A to select all, ALT-D to deselect all)
" Lines [QUERY] 	Lines in loaded buffers
" BLines [QUERY] 	Lines in the current buffer
" Marks 	Marks
" Locate PATTERN 	locate command output
" History/ 	Search history
" Snippets 	Snippets (UltiSnips)
" Commands 	Commands
" Maps 	Normal mode mappings
" Filetypes 	File types

