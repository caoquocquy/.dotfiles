" vim-plug ========================================================
set nocompatible
" filetype off

" Quick Fixes =================================================================
"vim has not yet support python3 so we need to silent that version so far
if has('python3')
  " silent! python3 1
endif

" Built In ====================================================================
set number                         " show line number
set expandtab                      " use spaces, not tab characters
set showmatch                      " show bracket matches
set incsearch                      " show search results as I type
set autoindent                     " set auto indent
set tabstop=2                      " set indent to 2 spaces
set shiftwidth=2
set list listchars=tab:»·,trail:·  " show extra space characters
set diffopt=vertical
set clipboard+=unnamed             " use the system clipboard
set nobackup
set noswapfile
set nowritebackup
" set colorcolumn=80              " show horizontal separator
" set laststatus=2                " always show status bar
" set scrolloff=2                 " minimum lines above/below cursor
" set ttimeoutlen=100             " decrease timeout for faster insert with 'O'
" set autoread                    " auto reload file
" set hlsearch                    " highlight all search matches
" set cursorline                  " highlight current line
" set smartcase                   " pay attention to case when caps are used
" set relativenumber              " show relative line numbers
" set ignorecase                  " ignore case in search
" set vb                          " enable visual bell (disable audio bell)
" set ruler                       " show row and column in footer
" set nofoldenable                " disable code folding
" set wildmenu                    " enable bash style tab completion
" set wildmode=list:longest,full

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-grepper'
" Open a Quickfix item in a window you choose. (Vim plugin)
Plug 'yssl/QFEnter'
" An asynchronous fuzzy finder which is used to quickly locate files, buffers,
" mrus, tags, etc. in large project.
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
Plug 'ngmy/vim-rubocop'
Plug 'casecommons/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'mgechev/vim-jsx'
Plug 'chriseppstein/vim-haml'
Plug 'hiukkanen/vim-hamlc'
Plug 'tpope/vim-cucumber'
Plug 'ludovicchabant/vim-gutentags'
Plug 'matze/vim-move'
Plug 'tpope/vim-commentary'
Plug 'lifepillar/vim-solarized8'
call plug#end()

" :PlugInstall to install the plugin

" syntax on                         " show syntax highlighting
" filetype plugin indent on


" tpope/vim-fugitive ==========================================================
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gd :Gdiff<CR>
" Get changes from my (target) branch
nnoremap gm :diffget //2<CR>
" Get changes from their (merge) branch
nnoremap gt :diffget //3<CR>

" haml ========================================================================
let g:move_key_modifier = 'C'
au! BufRead,BufNewFile *.inky-haml setfiletype haml
au! BufRead,BufNewFile *.hamlc setfiletype haml
augroup VimMoveKey
  autocmd!
  autocmd VimEnter * nunmap <C-h>
  autocmd VimEnter * nunmap <C-l>
  autocmd VimEnter * vunmap <C-h>
  autocmd VimEnter * vunmap <C-l>
augroup END


" Remap leader key to SPACE
let mapleader="\<SPACE>"


" ngmy/vim-rubocop ============================================================
let g:vimrubocop_config = '~/Documents/workspace/tinypulse/.rubocop.yml'

nnoremap <Leader>ru :RuboCop<CR>


" wycats/nerdtree =============================================================
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>

let g:NERDTreeMapOpenSplit = 'v'
let g:NERDTreeMapOpenVSplit = 'h'



" rspec-cucumber.vim ==========================================================
" RSpec.vim mappings
nnoremap <Leader>t :call RunNearestSpec()<CR>
nnoremap <Leader>T :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>
" nnoremap <Leader>a :call RunAllSpecs()<CR>

" Built In Buffer =============================================================
" nnoremap <Leader>b :buffers<CR>
" nnoremap <Leader>1 :b 1<CR>
" nnoremap <Leader>2 :b 2<CR>
" nnoremap <Leader>3 :b 3<CR>
" nnoremap <Leader>4 :b 4<CR>
" nnoremap <Leader>5 :b 5<CR>

nnoremap <Leader>h :vsplit<CR>
nnoremap <Leader>v :split<CR>
nnoremap <Leader><Leader> :e#<CR>


" rking/ag.vim ================================================================
" nnoremap <leader>a :Ag ""<Left>
" let g:ag_prg='ag --vimgrep -S --path-to-ignore ~/.ignore'


" Window Zooming ==============================================================
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Copy File Path ==============================================================
nnoremap <C-g> :let @*=expand("%") <bar> :let @0=expand("%") <bar> :echo "\"" . expand("%") . "\"" . " relative path copied"<CR>

" Grepper
let g:default_grepper_options = {
            \ 'open':                1,
            \ 'switch':              1,
            \ 'jump':                0,
            \ 'prompt_mapping_tool': '<C-\>',
            \ 'tools':               ['rg', 'ag', 'git', 'grep', 'findstr'],
            \ 'stop':                2000,
            \ }

let g:grepper = copy(g:default_grepper_options)

command! -nargs=* -complete=customlist,grepper#complete LGrepper Grepper -noquickfix <args>
command! -nargs=* -complete=customlist,grepper#complete BGrepper LGrepper -buffer <args>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <silent> <Leader>S :Grepper<CR>
nnoremap <silent> <Leader>s :Grepper -noprompt -cword<CR>

" Startify
let g:startify_skiplist = [
      \ '.git/index',
      \ '.git/config',
      \ 'COMMIT_EDITMSG',
      \ 'git-rebase-todo',
      \ escape(fnamemodify($VIMRUNTIME, ':p'), '\') . 'doc',
      \ ]

let g:startify_enable_special     = 0
let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 0
let g:startify_relative_path      = 1
let g:startify_update_oldfiles    = 1
let g:startify_show_sessions      = 1
let g:startify_custom_header      = [] " Disable random quotes header

nnoremap <silent> <Leader>h :Startify<CR>

" LeaderF
let g:Lf_WindowHeight  = 0.30
let g:Lf_MruMaxFiles   = 200
" let g:Lf_CursorBlink   = 0 " When set this setting to 0, C-J & C-K do not work, temporarily disable it
let g:Lf_PreviewResult = { 'BufTag': 0, 'Function': 0 }
let g:Lf_StlSeparator  = { 'left': '', 'right': '' }

let g:Lf_UseCache      = 0 " rg/ag is enough fast, we don't need cache
let g:Lf_NeedCacheTime = 5 " 5 seconds

" let g:Lf_NoChdir              = 1
let g:Lf_WorkingDirectoryMode = 'c'

if executable('fd')
    let g:Lf_ExternalCommand = 'fd --color=never --no-ignore-vcs --hidden --type file . %s'
elseif executable('ag')
    let g:Lf_ExternalCommand = 'ag %s --nocolor --skip-vcs-ignores --hidden -l -g ""'
elseif executable('rg')
    let g:Lf_ExternalCommand = 'rg %s --color=never --no-ignore-vcs --hidden --files'
endif
nnoremap <Leader>f :LeaderfFile<CR>
nnoremap <Leader>b :LeaderfBuffer<CR>
nnoremap <Leader>r :LeaderfRgRecall<CR>
nnoremap <Leader>/ :LeaderfRgInteractive<CR>
nnoremap <Leader>o :LeaderfFunction<CR>
nnoremap <Leader>O :LeaderfMru<CR>
nnoremap <Leader>l :LeaderfLine<CR>

" lifepillar/vim-solarized8 ===================================================
set background=dark

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme solarized8
