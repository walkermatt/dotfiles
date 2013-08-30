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
set wildmode=full
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
    set guifont=inconsolata\ 10
    " set guifont=ubuntu\mono\ 11
    " set guifont=monaco\ 10
    " set guifont=DejaVu\ Sans\ Mono\ 9
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
" cnoremap w!! w !sudo tee % >/dev/null
command! -nargs=0 W w !sudo tee % >/dev/null

" Make the directory and parents for the current file
" cnoremap mkdir !mkdir -p %:h
command! -nargs=0 Mkdir !mkdir -p %:h

" set shell=/bin/bash

" Suppress the 'Thanks for flying Vim' message in the terminal
let &titleold=getcwd()

" Find as entering pattern
set incsearch

" Make the search non-regex by default (breaks cit, vat etc.)
" set nomagic

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
" set textwidth=80
" set formatoptions=qrn1

au ColorScheme * call ModColorScheme()

function! ModColorScheme()
    if (g:colors_name =~ "desert")
        " Background of no text the same as std background
        hi NonText guifg=grey60 guibg=grey20
    elseif (g:colors_name =~ "vitamins")
        " Background of no text the same as std background
        hi NonText guibg=#242424
        " More subtle search highlight
        hi Search ctermbg=DarkYellow guibg=#F8DE7E
        hi SpecialKey guibg=NONE gui=NONE
    elseif (g:colors_name =~ "solarized")
        "hi Normal guibg=#242424
    elseif (g:colors_name =~ "badwolf")
        " More subtle search highlight
        hi Search ctermbg=DarkYellow guibg=#F8DE7E
        hi LineNr ctermfg=grey ctermbg=black guibg=black guifg=grey
    elseif (g:colors_name =~ "jellybeans")
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
    hi MatchParen cterm=bold ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#a58226
endfunction

" Specify a dark background
set background=dark

" colorscheme solarized
colorscheme jellybeans
" colorscheme badwolf
" colorscheme desert
" colorscheme vitamins
" colorscheme wombat256i

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

" Specific tab settings for yaml
autocmd FileType yaml setlocal softtabstop=2 | setlocal shiftwidth=2

" Commentary settings (actually a standard Vim setting
" but it's used by the Commentary plugin)
autocmd FileType lisp set commentstring=;\ %s
autocmd FileType upstart set commentstring=#\ %s
autocmd FileType config set commentstring=#\ %s
autocmd FileType mapfile set commentstring=#\ %s

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
set history=2000

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

" Resize splits when the window is resized
" au VimResized * exe "normal! \<c-w>="

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

let mapleader = ","

" Swap the go to mark keys, so that ' which is easy to hit
" goes to the precise line/column when returning to a mark
nnoremap ' `
nnoremap ` '

"nnoremap <leader>A Ea
"nnoremap <leader>a ea

" For this to work it needs to know if it's already within a set of parenthesis, at the moment it doesn't
" as an example try: args = docopt(foo, (var))
" onoremap i( :<c-u>normal! %vi(<cr>

" Shortcut for the substitute command
" from current line to the end of the buffer
" To warp around once you've reached the bottom
" do "gg" to get to the top and "@:" to repeat
" last ex command
nnoremap <leader>s :,$s/

" Shortcut for substitute command in visual mode
vnoremap <leader>s y:,$s/<c-r>=GetSelectedText("search")<cr>/

" cnoremap wrap  |1,''-&&

" Find selected text
" vnoremap <leader>/ y:/<c-r>=GetSelectedText("search")<cr>
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

" Select all text in a buffer with ctrl-a
" nnoremap <c-a> ggVG<cr>

" Pre-populate the command line with :Command-T /current/directory/
"nnoremap <leader>t :CommandT <c-r>=expand("%:p:h") . "/" <cr>

" Make changing directory to the current buffer easy
noremap <leader>cd :cd %:p:h

" Set up mappings in regular buffers to
" all using Enter and Shift-Enter to insert
" blank lines and ensure they are cleared
" for special buffers that need to use Enter
augroup enter_insert
    au!
    au BufEnter * call AboveBelow()
    au BufWinEnter * call AboveBelow()
    au CmdwinEnter * call AboveBelow()
augroup END

function! AboveBelow()
    let below = 'o<Esc>cc<Esc>'
    let above = 'O<Esc>cc<Esc>'
    " echom '&buftype: ' . &buftype
    if(&buftype == '')
        " Regular file buffer
        " Not using <buffer> as it breaks the
        " LustyJuggler
        execute 'nnoremap <enter> ' . below
        execute 'nnoremap <s-enter> ' . above
    else
        " Special buffer such as QuickFix, NERDTree
        " LocationList etc.
        if (maparg('<enter>', 'n') == below)
            execute 'nunmap <enter>'
        endif
        if (maparg('<s-enter>', 'n') == above)
            execute 'nunmap <s-enter>'
        endif
    endif
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

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

" FanfingTastic options
" let g:fanfingtastic_use_jumplist = 1

" Remap ; and , commands so they also work after t and T
" Only do the remapping for normal and visual mode, not operator pending
" Use @= instead of :call to prevent leaving visual mode
" nnoremap <silent> ; @=FixCommaAndSemicolon(";")<CR>
" nnoremap <silent> , @=FixCommaAndSemicolon(",")<CR>
" vnoremap <silent> ; @=FixCommaAndSemicolon(";")<CR>
" vnoremap <silent> , @=FixCommaAndSemicolon(",")<CR>

" function! FixCommaAndSemicolon(command)
"    let s:pos1 = getpos(".")
"    execute "normal! " . a:command
"    let s:pos2 = getpos(".")
"    if s:pos1 == s:pos2
"       execute "normal! 2" . a:command
"    endif
"    return ""
" endfunction

" Open this file in a split for editing
" nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Make the down and up keys take wrapped lines in to account
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Slightly more consistent word and WORD movement just like ge
" nnoremap gw b
" nnoremap gW B

" I really struggle with ^ for some reason, and this is similar to g_
" nnoremap g0 ^

" readline movements in normal mode, already available in command mode
" nnoremap <c-e> $

" nnoremap _ $
" nnoremap _ g_
" vnoremap _ $h
" vnoremap _ g_
" noremap - ^

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

" Easily escape from normal mode
inoremap jj <esc>
inoremap jk <esc>

" Allow the use of s in visual mode to replace selected
" and enter insert mode. This mapping is required so that
" surround.vim does not hijack it
vnoremap s s

" Easily append to the end of current line in insert mode
" inoremap aa <Esc>A

" Readline start / end of line in insert mode
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$
cnoremap <c-a> <home>

" Ctrl-Delete deletes previous word like in Linux
inoremap <c-bs> <c-w>

" Delete current buffer without closing the window it's shown in
nnoremap <leader>x :Sbd<cr>
" nnoremap <leader>x :BD<cr>
" nnoremap <leader>x :bd<cr>

" Delete a buffer *and* close the window
nnoremap <leader>xx :bdelete<cr>

" Shortcut to open a new vertical split and switch to it ([w]indow [o]pen)
" nnoremap <leader>wo <C-w>v<C-w>l
" nnoremap <leader>wo <C-w>v
nnoremap <leader>wo :echo 'Try Ctrl-W v'<cr>

" Close the current window ([w]indow [x])
" nnoremap <leader>wx :close<cr>
nnoremap <leader>wx :echo 'Try Ctrl-W c'<cr>

" Map F1 to escape as :help is more useful
noremap <F1> <esc>

" Pressing F2 will toggle paste mode that allows you to paste text and preserve indentation
set pastetoggle=<F2>

" F3 is used by NERDTree

" Show a list of buffers including closed buffers when F5 is pressed, type a buffer number and <Enter> to switch to a buffer
" nnoremap <F5> :buffers!<CR>:buffer<Space>
nnoremap <F5> :MRU<cr>
nnoremap <leader>lv :MRU<cr>

" F6 is used by pep8

" Toggle spell check with F7
noremap <F7> :set spell!<cr>
" Enable spell check when using next spell command
nnoremap z= :set spell<cr>z=
nnoremap ]s :set spell<cr>]s
nnoremap [s :set spell<cr>[s

" Allow access to c-v for special characters
"inoremap <F8> <c-v>

" Build tags for the cwd and down, jump to a definition with ctrl-]
noremap <F9> :!ctags -R<cr>

" Toggle TagBar
noremap <F10> :TagbarToggle<cr>

" Toggle fullscreen with F11
if has("unix")
    noremap <F11> :!wmctrl -r :ACTIVE: -b toggle,fullscreen<cr><cr>:VimroomToggle
else
    noremap <F11> :VimroomToggle<cr>
end

" call yankstack#setup()

" nmap \p <Plug>yankstack_substitute_older_paste
" nmap \n <Plug>yankstack_substitute_newer_paste

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

" Conventional copy and paste?
" inoremap <c-v> <esc>"+Pa
" inoremap <c-v> <c-r>+

" This works pretty well the only downside is that auto indetation
" gets removed.
" May be use :echo matchstr(@+, '\n') != '' to find if there are new lines to
" determine if set paste is required?
" inoremap <c-v> <c-o>:set paste<cr><c-r>+<c-o>:set nopaste<cr>

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

" Open a terminal at the current working directory
command! -nargs=0 Sh silent !mate-terminal &
" command! -nargs=0 Folder silent !caja . &

" Like '*' (highlight all occurrences of the word under the cursor) but do not
" move to the next occurrence until 'n' is pressed
" nnoremap * :let @/='\<<c-r>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" nnoremap * mz*N`z

" Format JavaScript
"nnoremap <silent> <leader>fjs :call g:Jsbeautify()<cr>

" Pretty print the selected xml fragment using the external tidy utility
vnoremap <leader>fx :!tidy -q -i -xml --indent-spaces 4 --wrap 0<CR>
nnoremap <leader>fx :%!tidy -q -i -xml --indent-spaces 4 --wrap 0<CR>
" onoremap <leader>fx :%!tidy -q -i -xml --indent-spaces 4 --wrap 0<CR>

"JSON validate and pretty print
vnoremap <leader>fj :!python -mjson.tool<cr>
nnoremap <leader>fj :%!python -mjson.tool<cr>

" URL encode and decode
vnoremap <leader>du :!urlencode --decode<cr>
vnoremap <leader>eu :!urlencode<cr>

" XML escape and unescape
vnoremap <leader>ux :!xmlescape --unescape<cr>
vnoremap <leader>ex :!xmlescape<cr>

" EasyMotion options and mappings
" let g:EasyMotion_do_mapping = 0

"nnoremap <silent> f      :call EasyMotion#F(0, 0)<CR>
"onoremap <silent> f      :call EasyMotion#F(0, 0)<CR>
"vnoremap <silent> f :<C-U>call EasyMotion#F(1, 0)<CR>

" nnoremap <silent> <Leader>f      :call EasyMotion#F(0, 0)<CR>
" onoremap <silent> <Leader>f      :call EasyMotion#F(0, 0)<CR>
" vnoremap <silent> <Leader>f :<C-U>call EasyMotion#F(1, 0)<CR>

" nnoremap <silent> <Leader>F      :call EasyMotion#F(0, 1)<CR>
" onoremap <silent> <Leader>F      :call EasyMotion#F(0, 1)<CR>
" vnoremap <silent> <Leader>F :<C-U>call EasyMotion#F(1, 1)<CR>

" nnoremap <silent> <Leader>t      :call EasyMotion#T(0, 0)<CR>
" onoremap <silent> <Leader>t      :call EasyMotion#T(0, 0)<CR>
" vnoremap <silent> <Leader>t :<C-U>call EasyMotion#T(1, 0)<CR>

" nnoremap <silent> <Leader>T      :call EasyMotion#T(0, 1)<CR>
" onoremap <silent> <Leader>T      :call EasyMotion#T(0, 1)<CR>
" vnoremap <silent> <Leader>T :<C-U>call EasyMotion#T(1, 1)<CR>

" CtrlP
let g:ctrlp_working_path_mode = 'c'

" LustyJuggler options
let g:LustyJugglerAltTabMode = 1
let g:LustyJugglerShowKeys = 'a'

" LustyExplorer mappings
" nnoremap <leader>lh :LustyFilesystemExplorer ~<cr>
nnoremap <silent> <a-s> :LustyJuggler<cr>
nnoremap <silent> s :LustyJuggler<cr>
nnoremap <silent> <a-a> :LustyJugglePrevious<cr>
nnoremap <silent> a :LustyJugglePrevious<cr>

" Powerline settings
let g:Powerline_symbols = 'compatible'

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python'],
                           \ 'passive_filetypes': [] }
"
" Disable yank ring for now as it was messing up some other mappings
" such as yt) (yank until right parenthesis)
" let g:yankring_enabled = 0

" Don't include files in /tmp in the Most Recently Used list
" so that `It`s all text' and similar browser extension temp files
" don't get recorded
let MRU_Exclude_Files = '^/tmp/.*'

let MRU_Max_Entries = 1000

" Set up ack.vim options including searching all files
"let g:ackprg="ack-grep --with-filename --all-types --nocolor --nogroup --column"
" let g:ackprg="ack-grep -H --nocolor --nogroup --column --all-types --ignore-case"
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-case"
nnoremap <leader>a :Ack! 
vnoremap <leader>a :<c-u>Ack! <c-r>=GetSelectedText("very_magic")<cr>

" Auto Complete options
" let g:acp_enableAtStartup = 0
" let g:acp_ignorecaseOption = 0
" let g:acp_behaviorKeywordLength = 4

" Use the awesome python auto complete function
autocmd FileType python set omnifunc=pythoncomplete#Complete

" NERDTree mappings and options
" noremap  <F3> :NERDTreeFind<cr>
" inoremap <F3> <esc>:NERDTreeToggle<cr>

" let NERDTreeMapHelp='<F1>'
" let NERDTreeMinimalUI=1
" let NERDTreeQuitOnOpen=1

" noremap  <F3> :45vsplit<cr>:e.<cr>
" Pattern to hide dotfiles in built-in file browser
" let g:netrw_list_hide= '^\..*'

" Python pep8 options
let g:pep8_map='<F6>'

" The awesome VimRoom plugin for distraction free mode
let g:vimroom_guibackground="#242424"
let g:vimroom_width=100
let g:vimroom_sidebar_height=1
let g:vimroom_scrolloff=1

" Status line
set laststatus=2
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.
set statusline+=\    " Space.
set statusline+=%=   " Right align.
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
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
    set sessionoptions=buffers,curdir
    execute 'mksession! ' . a:session_file
endfunction

function! RestoreSession()
    " if argc() == 0 && has("gui_running") && v:servername == "GVIM"
    if argc() == 0
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

" Merge a second instance of Vim into the first one
function! SingleInstance()

    if !has("gui_running")
        return
    elseif g:SingleInstance_the_one_and_only !=? 1
        return
    elseif has("mac")
        return
    endif

    if v:servername !=? "GVIM"

        " Loop through *all* buffers and add them to the main window before
        " quitting

        let i = 1
        while i <= bufnr('$')
            if bufexists(i)
                " get opened file name
                "let myfile = expand("%:p")
                let myfile = fnamemodify(bufname(i), ":p")
                " reverse backslashes
                let myfile = substitute(myfile, '\\', '/', 'g')
                " escape
                let myfile = escape(myfile, ' ')
                " edit current file, maintain this position
                let mycmd = "<C-\\><C-n>:edit +" . line('.') . ' ' . myfile . '<CR>'
                call remote_send('GVIM', mycmd)
            endif
            let i = i + 1
        endwhile 

        call remote_foreground('GVIM')

        " Quit
        qall!

    end

endfunction

let g:SingleInstance_the_one_and_only = 0
autocmd VimEnter * call SingleInstance()

" Protect large files from sourcing and other overhead.
"if !exists("my_auto_commands_loaded")
"  let my_auto_commands_loaded = 1
"  let g:LargeFile = 1024 * 1024 * 10
"  augroup LargeFile
"    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
"    augroup END
"endif

" Very simple Slime like thing to send selected text to a clisp REPL running
" in a screen session started with `screen -S vim_repl -t vim_repl`. Uses the r
" register which is fine by me as I hardly ever use more than a few registers
function! SendToScreen(text)
    echo system("screen -S vim_repl -p vim_repl -X stuff '" . substitute(a:text, "'", "'\\\\''", 'g') . "'")
endfunction
vnoremap <C-c><C-c> "ry :call SendToScreen(@r)<CR>
