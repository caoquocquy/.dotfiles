" ---------------------------------------------------------------------------------------------------------------------
" junegunn/vim-plug
call plug#begin()
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" brew install rg

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
Plug 'lifepillar/vim-solarized8'
Plug 'yggdroot/indentline'
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
let g:fzf_layout = { 'down': '30%' } " - down / up / left / right

command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*,tmp/*,log/*,.bundle,vendor/bundle/*,gems/*,.gems/*,components/*/gems/*}"', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse'}))
nnoremap <Leader>f :All<CR>

" ---------------------------------------------------------------------------------------------------------------------
" thoughtbot/vim-rspec
" let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec} --format documentation\n")'

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
" rking/ag.vim
" let g:ag_working_path_mode='r'
" let g:ag_prg='ag --vimgrep -S --path-to-ignore ~/.ignore'

" nnoremap <Leader>s :Ag --ruby <C-R><C-W><CR>
" nnoremap <Leader>/ :Ag --ruby ""<Left>

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
" Yggdroot/LeaderF
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_ShowDevIcons = 0

" nnoremap <Leader>f :LeaderfFile<CR>

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

" ---------------------------------------------------------------------------------------------------------------------
" Thinner the horizontal separator
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE ctermfg=Green guifg=#839289
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
hi NonText ctermfg=darkcyan guifg=darkcyan
