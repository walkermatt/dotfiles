" Vundle config for plugins
source ~/.vim/bundles.vim

" Enable inline vim code as I use it for my todo.txt
set modelines=1

" Default to UTF-8 encoding
set encoding=utf-8

" Set the language for spell checking to British English
set spelllang=en_gb

" Show the cursor position in the status line
set ruler

" Show what mode we are in
set showmode

" Show the command line at the bottom of the window
set showcmd

" Allow unused buffers to be hidden with pending edits
set hidden

" When switching to an already open buffer focus the window if it's already open
" in if any
set switchbuf=useopen

set nosplitright
set splitbelow

" Display warnings visually - no need to ring the bell or flash at me
set visualbell
set novb

" Enable the wildmenu which provides enhanced command completion when tab is pressed
set wildmenu
set wildmode=longest,full
set wildignore=*.pyc

" Auto complete
set completeopt=longest,menuone,preview

" Highlight the current line
set cursorline
" And the column 80
" set colorcolumn=80

" Don't just snap to the bottom of the page when scrolling search results
set scrolloff=1

" Improve redraw performance
set ttyfast

" Show title
set title

" Use 256 colors in the terminal
set t_Co=256

" No toolbar in gvim
set guioptions-=T

" No menu in gvim
set guioptions-=m

" No right scrollbar
set guioptions-=r

" No left scrollbar in vsplit
set guioptions-=L

" Text dialogs in GVIM which don't suffer from
" loosing focus like the GUI dialogs
set guioptions+=c

" Set the font
if has("unix")
    " set guifont=inconsolata\ 9
    " set guifont=ubuntu\mono\ 11
    " set guifont=monaco\ 10
    " set guifont=DejaVu\ Sans\ Mono\ 9
    " set guifont=FiraMono\ 9
    " set guifont=M+\ 1m\ regular
else
    set guifont=Courier_New:h9:cANSI
end

" Disable the splash screen
set shortmess+=I

" Turn on line numbering.
set number

" Set syntax on
syntax enable

" Indent automatically depending on filetype
set autoindent
set smartindent

" Round indent to multiple of 'shiftwidth'
set shiftround

" Make matching parenthesis very obvious by flicking back to the opening paren
" when typing the closing
set showmatch

" Lifted from http://www.vimbits.com/bits/361 to
" give a more granular undo in insert mode
" augroup insert_undo
"     au!
"     au CursorHoldI * :call feedkeys("\<c-g>u",'t')
"     au InsertEnter * let updaterestore=&updatetime |
"                 \ set updatetime=500
"     au InsertLeave * let &updatetime=updaterestore
" augroup END

" Backspace over everything
set backspace=indent,eol,start

" Automatically cd to the directory of the current file
set autochdir

" Write the file when focus is lost etc.
" set autowrite

" Sudo to write from Steve Losh
command! -nargs=0 W w !sudo tee % >/dev/null

" Make the directory and parents for the current file
command! -complete=file -nargs=0 Mkdir !mkdir -p %:h

" Suppress the 'Thanks for flying Vim' message in the terminal
let &titleold=getcwd()

" Display file sizes as human readable in netrw
let g:netrw_sizestyle="h"

" Find as entering pattern
set incsearch

" Default to replacing all occurrences within the specified range
set gdefault

" Case insensitive search
set ic

" Respect case if the search string is mixed case
set smartcase

" Highlight search
set hls

" Enable the matchit plugin bundled with vim that extends %
" to match start/end xml tags, function definitions etc.
runtime macros/matchit.vim

" Wrap text instead of being on one line
set wrap
set linebreak
set display+=lastline
set showbreak=↪

au ColorScheme * call ModColorScheme()

function! ModColorScheme()
    if (g:colors_name =~ "jellybeans")
        " More obvious search highlight, cursor and line numbers
        hi Search guifg=black guibg=#F8DE7E ctermfg=16 ctermbg=187
        hi IncSearch guifg=#0a9dff guibg=#000000 ctermfg=blue ctermbg=black
        hi Cursor guifg=NONE guibg=#656565 gui=NONE ctermbg=0x241
        hi LineNr guibg=black guifg=grey ctermfg=grey ctermbg=16
        hi VertSplit guifg=#404c41 guibg=#403c41 ctermfg=black ctermbg=black
        " Remove the background of listchar characters
        hi SpecialKey guibg=NONE gui=NONE
    end
    " Highlight matched parenthesis by making them bold and red
    hi MatchParen cterm=bold ctermbg=NONE ctermfg=red guibg=NONE guifg=#a58226
endfunction

let g:jellybeans_background_color = "0a0a0a"

" Light colorscheme for use with a projector
command! Light set background=light | colorscheme bclear | set guifont=inconsolata\ 11 | :AirlineTheme light
" Back to black
command! Dark set background=dark | colorscheme jellybeans | set guifont=inconsolata\ 11 | :AirlineTheme solarized_flood

autocmd VimEnter * :Dark

" No. of spaces for tab in file
set tabstop=4
" No. of spaces for step in autoindent
set shiftwidth=4
" No. of spaces for tab when editing
set softtabstop=4
" Expand tabs into spaces
set expandtab
" Smart tabulation and backspace
set smarttab

" Define any new filetype associations
autocmd BufNewFile,BufRead *.vrt set filetype=xml
autocmd BufNewFile,BufRead *.sld set filetype=xml
autocmd BufNewFile,BufRead *.gfs set filetype=xml
autocmd BufNewFile,BufRead *.gml set filetype=xml
autocmd BufNewFile,BufRead *.qgs set filetype=xml
autocmd BufNewFile,BufRead *.config set filetype=dosini
autocmd BufNewFile,BufRead *.cfg set filetype=dosini
autocmd BufNewFile,BufRead *.geojson set filetype=json
autocmd BufNewFile,BufRead *.svelte set ft=html

" Specific tab settings for yaml and elm
autocmd FileType yaml,elm setlocal softtabstop=2 | setlocal shiftwidth=2

" Commentary settings (actually a standard Vim setting
" but it's used by the Commentary plugin)
autocmd FileType lisp set commentstring=;\ %s
autocmd FileType upstart set commentstring=#\ %s
autocmd FileType dosini set commentstring=#\ %s
autocmd FileType mapfile set commentstring=#\ %s
autocmd FileType sql set commentstring=--\ %s
autocmd FileType dosbatch set commentstring=REM\ %s

" Default to not showing line endings and tabs but display nice
" characters when we do with 'set list'
set list
" set listchars=tab:›\ ,eol:¬
set listchars=tab:›\ 

" Trailing whitespace - only shown when not in normal mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
augroup END

" Store a generous history of previous commands
set history=10000

" Enable mouse in normal and visual only (enabling in insert
" is a pain in the ass when on the laptop due to catching
" the trackpad)
" set mouse=nv
" Lets try it disabled for now...
set mouse=

" Auto Commands

" Make sure Vim returns to the same line when you reopen a file from Steve Losh
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Write swap and backup files to a single folder
if has("unix")
    set backupdir=/var/tmp/vim//
    set directory=/var/tmp/vim//
else
    set backupdir=$TEMP//
    set directory=$TEMP//
end
set noswapfile

" Custom mappings

map <space> <leader>

" Swap the go to mark keys, so that ' which is easy to hit
" goes to the precise line/column when returning to a mark
nnoremap ' `
nnoremap ` '

" Shortcut for the substitute command
" from current line to the end of the buffer
" To warp around once you've reached the bottom
" do "gg" to get to the top and "@:" to repeat
" last ex command
nnoremap <leader>s :,$s/

" Shortcut for substitute command in visual mode
vnoremap <leader>s y:,$s/<c-r>=GetSelectedText("search")<cr>/

" Find selected text
vnoremap <leader>/ /\V<c-r>=GetSelectedText("search")<cr>

function! GetSelectedText(escape_for) range
    normal! ""gvy
    let string = getreg('"')
    if (a:escape_for == "search")
        let string = escape(string, '\/[]~.*')
    elseif (a:escape_for == "very_magic")
        let string = escape(string, '^$.*\~[]()%')
    endif
    return string
endfunction

" Folding
set foldmethod=manual
set foldnestmax=2

" Use normal non-regex in search by default
nnoremap / /\V
vnoremap / /\V
onoremap / /\V
nnoremap ? ?\V
vnoremap ? ?\V
onoremap ? ?\V

" Make the down and up keys take wrapped lines in to account
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Disable the arrow keys :)
inoremap  <up>     <NOP>
inoremap  <down>   <NOP>
inoremap  <left>   <NOP>
inoremap  <right>  <NOP>
noremap   <up>     <NOP>
noremap   <down>   <NOP>

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Control-S to save in normal mode and insert mode
nnoremap <c-S> :update<CR>
inoremap <c-S> <esc>:update<CR>

" Variation for remote editing, which dismisses the 'press ENTER...' prompt
autocmd BufNewFile,BufRead scp://* nnoremap <buffer> <c-S> :update<CR><CR>

" Allow the use of s in visual mode to replace selected
" and enter insert mode. This mapping is required so that
" surround.vim does not hijack it
vnoremap s s

" Readline start / end of line in insert mode
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$
cnoremap <c-a> <home>
" Copied from rsi-vim, allow access to Vim's built-in |c_CTRL-A| (complete all
" matches)
cnoremap <c-x><c-a> <c-a>

" Toggle into command-line editting mode using readline 'fix-command' shortcut
cnoremap <c-x><c-e> <c-f>

" Ctrl-Delete deletes previous word
inoremap <c-bs> <c-w>
cnoremap <c-bs> <c-w>

" Map F1 to escape as :help is more useful
noremap <F1> <esc>

" Pressing F2 will toggle paste mode that allows you to paste text and preserve indentation
set pastetoggle=<F2>

" Clear search highlighting, spelling and command line
nnoremap <leader><space> :noh<cr>:set nospell<cr>:echo ""<cr>

" Enable spell check when using next spell command
nnoremap z= :set spell<cr>z=
vnoremap z= :set spell<cr>z=
nnoremap ]s :set spell<cr>]s
nnoremap [s :set spell<cr>[s

" Goyo settings
let g:goyo_width = 120

" Toggle fullscreen with F11
if has("unix")
    noremap <F11> :!wmctrl -r :ACTIVE: -b toggle,fullscreen<cr><cr>:Goyo
else
    noremap <F11> :Goyo<cr>
end

" make Y consistent with C and D
nnoremap Y y$

" Easy copy and paste using the system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
vnoremap <leader>yy "+yy
nnoremap <leader>Y "+y$
vnoremap <leader>Y "+y$

nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap <leader>dd "+dd
vnoremap <leader>dd "+dd
nnoremap <leader>D "+D
vnoremap <leader>D "+D

" nnoremap <leader>x "+x
" vnoremap <leader>x "+x
" nnoremap <leader>X "+X
" vnoremap <leader>X "+X

nnoremap <leader>c "+c
vnoremap <leader>c "+c
nnoremap <leader>cc "+cc
vnoremap <leader>cc "+cc
nnoremap <leader>C "+C
vnoremap <leader>C "+C

nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

inoremap <c-v> <c-r><c-p>+

" When using Ctrl-V to paste in the command-line escape
" the text if it resolves to a path
cnoremap <c-v> <c-r>=EscapeIfPath(getreg('+'))<cr>

function! EscapeIfPath(str)
    let str = a:str
    if match(str, 'file://') == 0
        " Remove protocol and substitute URL encoded spaces for file URLs
        let str = substitute(split(str, 'file://')[0], '%20' , ' ', 'g')
    endif
    if filereadable(str) || isdirectory(str)
        return escape(str, ' ')
    endif
    return str
endfunction

" Copy current filename into system clipboard
" Path
nnoremap <silent> <leader>cp :let @+ = expand("%:p:h") . "/"<CR>
" Path and file name
nnoremap <silent> <leader>cpp :let @+ = expand("%:p")<CR>
" File name
nnoremap <silent> <leader>cf :let @+ = expand("%:t")<CR>

" Open a terminal at the current working directory optionally passing command
" as args
function! OpenShell(args)
    let cmd = "!gnome-terminal -x sh -c '"
    if strlen(a:args)
        if isdirectory(a:args)
            let cmd = cmd . "cd " . a:args . "; "
        else
            let cmd = cmd . a:args . "; "
        end
    end
    let cmd = cmd . "exec bash' &"
    execute cmd
endfunction
command! -complete=shellcmd -nargs=* Sh silent call OpenShell(<q-args>)

au FileType javascript setlocal formatprg=prettier\ --parser=babel\ --single-quote
au FileType css setlocal formatprg=prettier\ --parser=css\ --stdin\ --single-quote
au FileType python setlocal formatprg=autopep8\ -aaa\ --experimental\ -

" Pretty print the selected xml fragment using the external tidy utility
vnoremap <leader>fx :!tidy -q -i -xml --indent-spaces 4 --wrap 0<CR>
nnoremap <leader>fx :%!tidy -q -i -xml --indent-spaces 4 --wrap 0<CR>
" onoremap <leader>fx :%!tidy -q -i -xml --indent-spaces 4 --wrap 0<CR>
" Use tidy as the formatprg when the filetype is XML
au FileType xml setlocal formatprg=tidy\ -q\ -i\ -xml\ --indent-spaces\ 4\ --wrap\ 0\ 2>/dev/null

" JSON validate and pretty print
vnoremap <leader>fj :!jsonformat<cr>
nnoremap <leader>fj :%!jsonformat<cr>
vnoremap <leader>fjs :!jsonformat -s<cr>

" URL encode and decode
vnoremap <leader>du :!urlencode --decode<cr>
vnoremap <leader>eu :!urlencode<cr>

" HTML entity encode and decode
vnoremap <leader>de :!he --decode<cr>
vnoremap <leader>ee :!he --encode<cr>

" XML escape and unescape
vnoremap <leader>ux :!xmlescape --unescape<cr>
vnoremap <leader>ex :!xmlescape<cr>

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" vim-slime
let g:slime_no_mappings = 1
" Use same mapping as fireplace for other stuff like SQL
autocmd FileType * if index(['clj', 'cljs'], &ft) < 0 | nmap cp <Plug>SlimeMotionSend
autocmd FileType * if index(['clj', 'cljs'], &ft) < 0 | nmap cpp <Plug>SlimeLineSend

" Airline status line
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'distinguished'

" Status line
set laststatus=2
set statusline=%f " Path.
set statusline+=%m " Modified flag.
set statusline+=%r " Readonly flag.
set statusline+=%w " Preview window flag.
set statusline+=\ " Space.
set statusline+=%= " Right align.
set statusline+=(
set statusline+=%{&ff} " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc} " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft} " Type (python).
set statusline+=)
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" Name of default vim session, glob expands the path
let g:session_file = glob('~/') . 'session.vim'
let g:session_restored = 0

" Save and restore session on leave and enter
function! SaveSession()
    if g:session_restored == 1
        " Only save the session for the main GVim window
        " if has("gui_running") && v:servername == "GVIM"
        let save_session = confirm("Save default session?", "&Yes\n&No")
        if save_session == 1
            call SaveSessionToFile(g:session_file)
        endif
    endif
endfunction

function! SaveSessionToFile(session_file)
    set sessionoptions=buffers,curdir,folds
    execute 'mksession! ' . a:session_file
endfunction

let g:reading_from_stdin = 0
autocmd StdinReadPost * let g:reading_from_stdin = 1

function! RestoreSession()
    " Display the prompt if there are no files passed to vim and we're not
    " reading from stdin (when reading from stdin &modified will be 1)
    if argc() == 0 && g:reading_from_stdin == 0
        let restore_session = confirm("Restore default session?", "&Yes\n&No")
        if restore_session == 1
            if filereadable(g:session_file)
                execute 'source ' . g:session_file
                let g:session_restored = 1
                syntax on
            else
                echom "Session file not readable?"
            endif
        endif
    endif
endfunction

autocmd VimLeave * call SaveSession()
autocmd VimEnter * nested call RestoreSession()

if has("gui_running")
    autocmd GUIEnter * winpos 40 40 | set lines=40 columns=120
endif

" Protect large files from sourcing and other overhead.
augroup LargeFile
    au!
    let g:LargeFile = 1024 * 1024 * 10
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | else | set eventignore-=FileType | endif
augroup END

command! -nargs=0 AutoMake autocmd BufWritePost <buffer> make

" When encrypting a file use blowfish
set cryptmethod=blowfish

