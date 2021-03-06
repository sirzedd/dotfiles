set nocompatible
filetype plugin indent on
execute pathogen#infect()

"Buffer plugin
", be - normal open
", bt - toggle open/close
", bs - horizontal split open
", bv - vertical split open
"push t on buffer to open in tab
"

"set nowrap
set nowrap

set relativenumber
set ruler
set visualbell
set encoding=utf-8
set shiftwidth=4
set softtabstop=4
set expandtab

set backspace=2 " more powerful backspacing

" ===== adding indenting visual. Can turn on/off with leader - ig
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1


" allow jsx in js
let g:jsx_ext_required = 0


"" vim-javacomplete2  https://github.com/artur-shaik/vim-javacomplete2
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"
"" enable smart (trying to guess import option) inserting class import with F4
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"
"" To enable usual (will ask for import option) inserting class imports with F5, add:
"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)
"
"" To add all missing imports with F6:
"nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"
""To remove all unused imports with F7:
"nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)






nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching

" ctrl-space autocomplete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Replace word under cursor globally
nnoremap <Leader>a :%s/\<<C-r><C-w>\>/

" Replace word under cursor in line
nnoremap <Leader>s :s/\<<C-r><C-w>\>/

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" remap VIM 0 to first non-blank character
map 0 ^

"use spaces instead of tabs 
set expandtab

"be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2


"<======= Highlighting for file =========>
autocmd BufEnter *.xml :setlocal filetype=xml

set encoding=utf-8
let g:Powerline_symbols = 'fancy'
set guifont=Inconsolata\ For\ Powerline

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" line numbers
set number
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Solarized
syntax on
syntax enable
"colorscheme monokai
set background=dark
let g:solarized_termcolors = 256
colorscheme desert2

" leader key
let mapleader = ','
" Leader - ( Spacebar )
" let mapleader = " "


" searching
set ignorecase smartcase incsearch hlsearch

" don't display welcome
set shortmess+=I

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

"Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowb
set noswapfile

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a
"set ttymouse=xterm2


"Toggle relative numbering, and set to absolute on loss of focus or insert
"mode
set rnu
function! ToggleNumbersOn()
  set nu!
  set rnu
endfunction
function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Always use vertical diffs
set diffopt+=vertical

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" Open new split panes to right and bottom, which feels more natural
" set splitbelow
set splitright

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Smart way to move between windows
" Commenting out to try to get tmux working with these
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" Exit insert mode by typing kj rather than esc
" http://www.guyrutenberg.com/2013/09/23/quickly-exiting-insert-mode-in-vim/
:inoremap kj <ESC>
" exit even if capital if in caps lock
:inoremap KJ <ESC>

" Wildmenu completion: use for file exclusions"
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.class "java/scala class files"
set wildignore+=*/target/* "sbt target directory"


" colorcolumn / print margin red bar 
:set colorcolumn=100

"set cursorline    " highlight the current line

" Faster copy to clipboard and pasting from clipboard
set clipboard=unnamed
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Highlights all words that are the same as cursor is on
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Basic SETUP:
set filetype=dosini

filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" set path+=**


" NOW WE CAN
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
"
" THINGS TO CONSIDER
" - :b lets you autocomplete any open buffer

" HIGHLIGHTS	
" - ^x^n for JUST this file
" - ^x^f for filenames
" - ^x^] for tags only, autocomplete for tags
" - ^n for anything specified by the 'complete' option
"
" NOW WE CAN
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:
" Tweaks for browsing
" let g:netrw_banner=0         " disable annoying banner
" let g:netrw_browse_split=4   " open in prior window
" let g:netrw_altv=1           " open splits to the right
" let g:netrw_liststyle=3      " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

"SNIPPET
"
nnoremap ,stest :-1read $HOME/.vim/snippets/.spock-test.groovy<CR>wi
nnoremap ,bash :-1read $HOME/.vim/snippets/bash-script-start<CR>wi

" NERDTREE:
"
"Open NERDTree automatically when vim starts up if no files were
"specified.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open NERDTree automatically when vim starts up on opening a directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" Rainbow parantheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NerdTree
map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:tmux_navigator_no_mappings = 1


" Quicker window movement
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

nnoremap <C-h> :TmuxNavigateLeft<cr>
nnoremap <C-j> :TmuxNavigateDown<cr>
nnoremap <C-k> :TmuxNavigateUp<cr>
nnoremap <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {c-b} :TmuxNavigatePrevious<cr>
"
"

" http://robots.thoughtbot.com/faster-grepping-in-vim/
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ctrlp sets its local working directory each time it's invoked.
    "https://github.com/kien/ctrlp.vim/issues/150   
    "I added
    " let g:ctrlp_working_path_mode = 0

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw! 
nnoremap \ :Ag<SPACE>

"cursor color
":hi CursorLine guifg=red guibg=blue
"
"highlight CursorLine ctermbg=Yellow ctermfg=None
"autocmd InsertEnter * highlight CursorLine ctermbg=Green ctermfg=Red
"autocmd InsertLeave * highlight CursorLine ctermbg=Yellow ctermfg=None

"set cursorline
"autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue
"autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue

"Change search color
"hi Search guibg=peru guifg=wheat
"hi Search cterm=None ctermfg=grey ctermbg=blue

"Powerline
set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"MacVim powerline
if has("gui_running")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=IMeslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h15
  endif
endif

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set rtp+=~/Google\ Drive/files/global/configs/vim/.vim/bundle/powerline/powerline/bindings/vim/

