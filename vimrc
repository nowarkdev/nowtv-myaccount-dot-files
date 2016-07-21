set nocompatible                  " Must come first because it changes other options.
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" enable system clipboard
if $TMUX == ''
  "set clipboard=unnamed
  set clipboard+=unnamed
endif

" let Vundle manage Vundle
Bundle 'VundleVim/Vundle.vim'
Bundle 'gmarik/vundle'
Bundle 'rking/ag.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'dkprice/vim-easygrep'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-bundler'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'godlygeek/tabular'
Bundle 'digitaltoad/vim-jade'
Bundle 'myusuf3/numbers.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'

Bundle 'Lokaltog/vim-easymotion'
map  f <Plug>(easymotion-bd-f)
map  F <Plug>(easymotion-bd-f)

Bundle 'Valloric/YouCompleteMe'
set completeopt-=preview

Bundle 'kien/rainbow_parentheses.vim'
" Toggle RainbowParenthese highlighting
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadBraces
let g:rainbow#blacklist = [233, 234, 236]

Bundle 'reedes/vim-colors-pencil'
colorscheme pencil
set background=dark

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
set autochdir
lcd %:p:h
autocmd BufEnter * let b:syntastic_javascript_eslint_exec = system('echo -n $(npm bin)/eslint')
let g:syntastic_error_symbol = '🔴'
highlight link SyntasticErrorSign SignColumn
let g:syntastic_warning_symbol = '🔵'
highlight link SyntasticWarningSign SignColumn

Bundle 'scrooloose/nerdtree'
map ,p :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

Bundle 'kien/ctrlp.vim'
map ,b :CtrlPBuffer<CR>

Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1

" Syntax highlighting
Bundle 'markcornick/vim-vagrant'

" Snippets in vim
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "garbas/vim-snipmate"

" Copy/Paste Mac
Bundle "kana/vim-fakeclip"

" Ack
Bundle 'ack.vim'

call vundle#end()

" format whole file
map <C-f> mzgg=G`z

set pastetoggle=<F2>

let mapleader = ","

" Tab to last buffer to make it easy to go to the last file you were in.
nmap <Tab> :b#<CR>

" Exit Vim quickly
map Q :qa<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

syntax enable                     " Turn on syntax highlighting.

set autoread                      " Turn on autoread to watch for changes
:au CursorHold * checktime        " Fires after you move the cursor and then let it sit still for updatetime

filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set noswapfile                    " Turn of .swp files

set wrap!

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Spell checking with ,s
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb

" CtrtlP Plugin mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Exclude the following:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
hi CursorLine ctermbg=240
hi Normal ctermbg=none

ab cl, console.log('=========>',)<ESC>i
ab des, describe('', () => {<CR>});<ESC>O
ab it, it('', () => {<CR>});<ESC>O
