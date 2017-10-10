"
" General behaviour
"

set autoindent                  " Indent at the same level of the previous line
set backspace=indent,eol,start  " Backspace for dummies
set expandtab                   " Tabs are spaces, not tabs
set hidden                      " Do not ask about unsaved buffers on exit
set history=1000                " Store a lot of history
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set paste                       " Paste mode by default
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set relativenumber              " Relative numbers in line number column
set shiftwidth=4                " Use indents of 4 spaces
set softtabstop=4               " Let backspace delete indent
set splitbelow                  " Puts new split windows to the bottom of the current
set splitright                  " Puts new vsplit windows to the right of the current
set tabstop=4                   " An indentation every four columns
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

let mapleader = ','
let maplocalleader = '_'

filetype plugin indent on
syntax on
scriptencoding utf-8

autocmd BufWritePre * %s/\s\+$//e

"
" Appearance
"

set background=dark
set colorcolumn=81
set cursorline                  " Highlight line under cursor
set hlsearch                    " Highlight search terms
set laststatus=2                " Always show statusline
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set list                        " Show listchars
set nofoldenable                " Disable folding
set nowrap                      " Do not wrap long lines
set number                      " Line numbers on
set showcmd                     " Show partial commands in status line and selected characters/lines in visual mode
set showmatch                   " Show matching brackets/parenthesis
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set t_Co=256                    " Set 256 terminal colors
set ttyfast                     " Fast terminal, smooth redraw
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
color monokai

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

highlight CursorLine cterm=NONE ctermbg=235

"
" Cursor restore
"

function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

"
" Motion
"

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

nmap <silent> Oa :wincmd k<CR>
nmap <silent> Ob :wincmd j<CR>
nmap <silent> Od :wincmd h<CR>
nmap <silent> Oc :wincmd l<CR>

"
" Undo and backups
"

set undofile
set undolevels=1000
set undoreload=10000
set undodir=$HOME/.vimundo
set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimswap
for dir in [&undodir, &backupdir, &directory]
    if !isdirectory(dir)
        call mkdir(dir)
    endif
endfor

"
" Hotkeys
"

" Json {
    nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    let g:vim_json_syntax_conceal = 0
" }

"
" Python IDE
"

let g:jedi#popup_select_first = 0

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_run = 0

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

"
" NERDTree
"

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

