" ============================================
"              Vim Config file
" ============================================

"Removes vi-compatibility (mandatory !)
set nocp

" File types and coloration have to be set here
syntax on
filetype plugin on
filetype indent on
set background=dark

" Set the best colorscheme.
color desert

" Set terminal to 256 colors.
set t_Co=256

" Set clipboard.
set clipboard=unnamedplus
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Set tab control.
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Set the tab completion just like bash.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" Map not too fast movments. (WARNING: Addictive movments).
nnoremap <S-j> 5j
nnoremap <S-k> 5k

" Default the statusline to green when entering Vim
hi statusline guibg=White ctermfg=8 guifg=White ctermbg=15

" Change color of the status bar.
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Green ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Red ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Default the statusline to gray when entering Vim.
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

"Auto-recognise fortran 90 / 77 identation differences.
nmap <S-z> :set syntax=fortran<CR>:let b:fortran_fixed_source=!b:fortran_fixed_source<CR>:set syntax=text<CR>:set syntax=fortran<CR>
nmap <C-z> :filetype detect<CR>

" Remap change between splits.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" No more delays between modes.
set timeoutlen=0
set ttimeoutlen=0

" Indentation and tabs python compatibility issues.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set cindent
filetype indent on

" Search.
set wrapscan            " Continue to top after reaching bottom
set hlsearch            " Highlight search
set incsearch           " See results of search step by step
set showmatch           " Parenthesis matches
set matchtime=2         " Show new matching parenthesis for 2/10th of sec

" System.
set vb t_vb=""          " Removes the Fucking Bell Of Death...
set history=1024        " Memorize 1024 last commands
set updatetime=2000     " Update swap (and showmark plugin) every 2 sec

" Command mode options
set wildmenu            " Completions view in ex mode (super useful !)
set cmdheight=1         " Command line height
set laststatus=2        " When to show status line (2=always)
set ruler               " Show line,col in statusbar
set number              " Show lines
set showmode            " Show mode in status (insertion, visual...)
set showcmd             " Show beginning of normal commands 

" Editing layout
set modeline
set formatoptions+=ln   "See :h 'formatoptions'
set linebreak           "Break lines at words, not chars
set so=5                "When moving vertical, start scrolling 4 before 

" Fix backspace
set backspace=start,indent,eol

" Don't complete bin files.
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.ps,*.pdf,*.cmo,*.cmi,*.cmx 

" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set relativenumber
    else
        set norelativenumber
        set nu!
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR>

" Mappings for up and down (multilines)
nmap <A-k> gk
nmap <A-j> gj

" C / C++ (OmniCppComplete)
autocmd FileType c,cpp map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Editing layout.
set formatoptions+=ln               " See :h 'formatoptions' :)
set backspace=start,indent,eol      " Fix backspace
set linebreak                       " Break lines at words, not chars
set so=4                            " When moving vertical, start scrolling 
                                    " 4 lines before reaching bottom

" Set bar on the cursor.
set cursorline

" Highlight the 80th colum of text. (Ctrl-h)
function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=80                                                
    endif
endfunction

nnoremap <C-g> :call g:ToggleColorColumn()<CR>

" Lets remap the capital W for faster usage.
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command WA wa
:command Wa wa

" Corrigindo problemas com o vim-latex
let g:Tex_BibtexFlavor = 'bibtex'
let g:Tex_BIBINPUTS = "%\.bib"
let g:Tex_DefaultTargetFormat='pdf'
let g:Imap_UsePlaceHolders = 0

" Desabilitando atalhos chatos como Traditional para /item e outros
let g:Tex_AdvancedMath = 0 
let g:Tex_EnvironmentMaps=0
let g:Tex_EnvironmentMenus=0
let g:Tex_FontMaps=0
let g:Tex_FontMenus=0
let g:Tex_SectionMaps=0
let g:Tex_SectionMenus=0

" Work with lines without change insert mode.
nmap <S-m> O<Esc>
nmap <C-m> o<Esc>

" Set buffer navigation using F10.
set wildcharm=<C-Z>

" Not jump when pressing *.
nnoremap * *<C-O>

" Remap H and L to end and begin of line.
noremap H ^
noremap L g_

" Set :noh to enter in command mode.
nnoremap <Space> :noh<CR><CR>

" Comment blocks of code.
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \   "fortran": '!',
    \   "make": '#',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <C-c> :call ToggleComment()<cr>
vnoremap <C-C> :call ToggleComment()<cr>

" Map buffer change.
nmap <F2> :bprev<Return>
nmap <F3> :bnext<Return>

" Overview of buffers with f10.
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Put information in the statusline.
set laststatus=2                             " always show statusbar  
set statusline+=%-10.3n\                     " buffer number  
set statusline+=%f\                          " filename   
set statusline+=%h%m%r%w                     " status flags  
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
set statusline+=%=                           " right align remainder  
set statusline+=%-14(%l,%c%V%)               " line, character  
set statusline+=%<%P                         " file position  

" Zoom window in tmux style super cool ! [Ctrl+x]
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-x> :ZoomToggle<CR>
