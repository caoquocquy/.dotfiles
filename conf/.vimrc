" ---------------------------------------------------------------------------------------------------------------------
" junegunn/vim-plug
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'lifepillar/vim-solarized8', { 'tag': 'v1.3.0' }
Plug 'yggdroot/indentline'
Plug 'pechorin/any-jump.vim'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" ---------------------------------------------------------------------------------------------------------------------
" Remap leader key to SPACE
let mapleader="\<SPACE>"

nnoremap <leader><leader> :e#<CR>

" ---------------------------------------------------------------------------------------------------------------------
" Built In
set nocompatible
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
set colorcolumn=120                " show horizontal separator

" ---------------------------------------------------------------------------------------------------------------------
" Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } } " popup

let s:fzf_files_command = 'rg --color=never --no-ignore-vcs --ignore-dot --ignore-parent --hidden --files'
let s:fzf_grep_command = 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '
let s:fzf_preview_dict = { 'options': ['--layout=reverse', '--preview-window', 'right:50%:hidden', '--bind', '?:toggle-preview'] }

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(
      \   <q-args>,
      \   extend(fzf#vim#with_preview(s:fzf_preview_dict), { 'source': s:fzf_files_command }),
      \   <bang>0
      \ )

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   s:fzf_grep_command.shellescape(<q-args>),
      \   1,
      \   fzf#vim#with_preview(s:fzf_preview_dict),
      \   <bang>0
      \ )

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>s :Rg <C-R><C-W><CR>
nnoremap <Leader>/ :Rg 
nnoremap <Leader>b :Buffers<CR>

" ---------------------------------------------------------------------------------------------------------------------
" thoughtbot/vim-rspec

map <Leader>t :call RunNearestSpec()<CR>
map <Leader>T :call RunCurrentSpecFile()<CR>

" ---------------------------------------------------------------------------------------------------------------------
" matze/vim-move
let g:move_key_modifier = 'C'

" ---------------------------------------------------------------------------------------------------------------------
" vim-airline/vim-airline
let g:airline_powerline_fonts = 1

" ---------------------------------------------------------------------------------------------------------------------
" wycats/nerdtree
let g:NERDTreeMapOpenSplit = 'v'
let g:NERDTreeMapOpenVSplit = 'h'

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>
nnoremap <Leader>h :vsplit<CR>
nnoremap <Leader>v :split<CR>

" ---------------------------------------------------------------------------------------------------------------------
" Window Zooming
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

" ---------------------------------------------------------------------------------------------------------------------
" Copy File Path
nnoremap <C-g> :let @*=expand("%") <bar> :let @0=expand("%") <bar> :echo "\"" . expand("%") . "\"" . " relative path copied"<CR>

" ---------------------------------------------------------------------------------------------------------------------
" Copy File Path
" mhinz/vim-startify
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

" ---------------------------------------------------------------------------------------------------------------------
" lifepillar/vim-solarized8
set background=dark

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:solarized_use16 = 1
let g:solarized_termcolors = 16

colorscheme solarized8

"----------------------------------------------------------------------------------------------------------------------
" Thinner the horizontal separator
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE ctermfg=Green guifg=#839289
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
hi NonText ctermfg=darkcyan guifg=darkcyan

"----------------------------------------------------------------------------------------------------------------------
" Prefered search engine: rg or ag
" Plug 'pechorin/any-jump.vim'
let g:any_jump_search_prefered_engine = 'rg'

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
" get left
nnoremap gdl :diffget //2<CR>
" get right
nnoremap gdr :diffget //3<CR>

" ---------------------------------------------------------------------------------------------------------------------
" Plug 'ludovicchabant/vim-gutentags'
set statusline+=%{gutentags#statusline()}

" let g:gutentags_trace = 1
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
