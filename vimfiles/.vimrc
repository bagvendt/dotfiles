set shm=atI                " Disable intro screen
set lazyredraw             " Don't redraw screen during macros
set ttyfast                " Improves redrawing for newer computers
set nobk nowb noswf        " Disable backup
set timeoutlen=500         " Lower timeout for mappings
set history=100            " Only store past 100 commands
set undolevels=150         " Only undo up to 150 times
set titlestring=%f title   " Display filename in terminal window
set ruf=%l:%c ruler        " Display current column/line in bottom right
set showcmd                " Show incomplete command at bottom right
set splitbelow             " Open new split windows below current
set bs=2                   " Allow backspacing over anything
set wrap linebreak         " Automatically break lines
set pastetoggle=<f2>       " Use <f2> to paste in text from other apps
set wildmode=full wildmenu " Enable command-line tab completion
set completeopt=menu       " Don't show extra info on completions
set wildignore+=*.o,*.obj,*.pyc,*.DS_Store,*.db " Hide irrelevent matches
set ignorecase smartcase   " Only be case sensitive when search has uppercase
set gdefault               " Assume /g flag on :s searches
set hidden                 " Allow hidden buffers
set mouse=nchr             " Enable mouse support, unless in insert mode
set enc=utf-8              " Enable unicode support
set nofoldenable           " Disable folding
ru macros/matchit.vim      " Enable extended % matching

if has('gui_running')
	set guicursor=a:blinkon0 " Disable blinking cursor
	set guioptions=haMR " Disable default menus (I've defined my own
	                    "                        in my .gvimrc)
	set columns=100 lines=38 " Default window size
endif
" Indentation
filetype plugin indent on
set ai ts=4 sw=4

" Theme
syntax on
color slate " My color scheme, adopted from TextMate
set hls " Highlight search terms
if &diff | syntax off | endif " Turn syntax highlighting off for diff

" Plugin Settings
let snips_author     = 'Michael Sanders'
let bufpane_showhelp = 0
let objc_man_key     = "\<c-l>"

" Highlight constants in Python
let python_highlight_numbers = 1
let python_highlight_exceptions = 1

" Correct some spelling mistakes

" Mappings
let mapleader = ','
" ^ is much more useful to me than 0
no 0 ^
no ^ 0
" Scroll down faster
no J 2<c-e>
no K 3<c-y>
" Swap ' and ` keys (` is much more useful)
no ` '
no ' `
" Much easier to type commands this way
no ; :
" Keep traditional ; functionality
no \ ;
" Keep traditional , functionality
no _ ,
" I always make this typo
no "- "_
" Paste yanked text
no gp "0p
no gP "0P

" Q: is a very annoying typo
nn Q <Nop>
" gj/gk treat wrapped lines as separate
" (i.e. you can move up/down in one wrapped line)
" I like that behavior better, so I inverted the keys.
nn j gj
nn k gk
nn gj j
nn gk k
" Keep traditional J functionality
nn <c-h> J
" Keep traditional K functionality
nn <c-l> K
" Make Y behave like D and C
nn Y y$
" Increment/decrement numbers
nn + <c-a>
nn - <c-x>
" Add a blank line while keeping cursor position
nn <silent> <c-o> :pu_<bar>cal repeat#set("\<c-o>")<cr>k
" Keep traditional <c-o> functionality
nn ,o <c-o>
" Easier way to navigate windows
nm , <c-w>
nn ,, <c-w>p
nn ,W <c-w>w
nn ,w :w<cr>
nn ,x :x<cr>
" Switch to alternate window (mnemonic: ,alternate)
nn ,a <c-^>
" Switch to current dir
nn ,D :lcd %:p:h<cr>
" Highlight/unhighlight lines over 80 columns
nn ,H :<c-u>cal<SID>ToggleLongLineHL()<cr>
" Turn off search highlighting
nn <silent> <c-n> :noh<cr>
nn <silent> ,R :cal<SID>RemoveWhitespace()<cr>
" Make c-g show full path/buffer number too
nn <c-g> 2<c-g>

" Easier navigation in command mode
no! <c-a> <home>
no! <c-e> <end>
cno <c-h> <left>
cno <c-l> <right>
cno <c-b> <s-left>
cno <c-f> <s-right>
" Make c-k delete to end of line, like in Bash
cno <c-k> <c-\>estrpart(getcmdline(), 0, getcmdpos()-1)<cr>
cno jj <c-c>

" Map these in visual mode, but not select
xno j gj
xno k gk
" vm selects until the end of line (but not including the newline char)
xno m $h
" Pressing v again brings you out of visual mode
xno v <esc>
" * and # search for next/previous of selected text when used in visual mode
xno * :<c-u>cal<SID>VisualSearch()<cr>/<cr>
xno # :<c-u>cal<SID>VisualSearch()<cr>?<cr>
" Pressing backspace in visual mode deletes to black hole register
xno <bs> "_x

" Easier navigation in insert mode
ino <silent> <c-b> <c-o>b
ino <silent> <c-f> <esc>ea
ino <c-h> <left>
ino <c-l> <right>
ino <c-k> <c-o>D
" <up> & <down> will move up/down if popup menu not up; otherwise,
" they will select items in the menu
ino <expr> <up> pumvisible() ? '<c-p>' : '<c-o>gk'
ino <expr> <down> pumvisible() ? '<c-n>' : '<c-o>gj'
" Much easier than reaching for escape
ino jj <esc>
" Open/close keyword completion menu
ino <expr> jx pumvisible() ? '<esc>a' : '<c-p>'
" Open/close omnicompletion menu
ino <expr> jX pumvisible() ? '<esc>a' : '<c-x><c-o>'
