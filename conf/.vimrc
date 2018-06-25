" VundleVim/Vundle.vim ========================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'
Plugin 'shougo/denite.nvim' " 'brew install Ag' first please
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'lifepillar/vim-solarized8'
Plugin 'bling/vim-airline'
Plugin 'vim-syntastic/syntastic'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-ruby/vim-ruby'
Plugin 'casecommons/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mgechev/vim-jsx'
Plugin 'chriseppstein/vim-haml'
Plugin 'hiukkanen/vim-hamlc'
Plugin 'tpope/vim-cucumber'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'matze/vim-move'
Plugin 'joom/vim-commentary'
call vundle#end()

" :PluginInstall to install the plugin

syntax on                         " show syntax highlighting
filetype plugin indent on


" Quick Fixes =================================================================
"vim has not yet support python3 so we need to silent that version so far
if has('python3')
  silent! python3 1
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

" tpope/vim-fugitive ==========================================================
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gd :Gdiff<CR>
" Get changes from target (self) branch
nnoremap gt :diffget //2<CR>
" Get changes from merge (their) branch
nnoremap gm :diffget //3<CR>

" haml ========================================================================
let g:move_key_modifier = 'C'
au! BufRead,BufNewFile *.inky-haml setfiletype haml
au! BufRead,BufNewFile *.hamlc setfiletype haml

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


" lifepillar/vim-solarized8 ===================================================
set background=dark
set shell=/bin/sh
colorscheme solarized8

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" rspec-cucumber.vim ==========================================================
" RSpec.vim mappings
nnoremap <Leader>t :call RunNearestSpec()<CR>
nnoremap <Leader>T :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>
" nnoremap <Leader>a :call RunAllSpecs()<CR>

" temporary for current workflow
let g:rspec_command = "Dispatch cd ~/code/coach_dev_env/; docker-compose exec coach rspec {spec}"


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


" shougo/denite.nvim ==========================================================
" It uses Ag as the core so we need to install that plugin: brew install Ag
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'Function')
" use ag for file & content search
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" ignores files
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \ 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

"call denite#custom#option('default', 'auto_resume', 1)
nnoremap <Leader>f :Denite file_rec<CR>
nnoremap <Leader>r :Denite -resume<CR>
nnoremap <Leader>b :Denite buffer<CR>
nnoremap <Leader>/ :Denite grep<CR>
nnoremap <Leader>o :Denite outline<CR>
nnoremap <Leader>l :Denite line<CR>
"grep with word under cursor
nnoremap <Leader>? :Denite grep:::`expand('<cword>')`<CR>
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-h>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-v', '<denite:do_action:split>', 'noremap')
