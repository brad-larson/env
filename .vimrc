execute pathogen#infect()

" File tabs
set tabpagemax=30
" Indents
set tabstop=4
set expandtab
set shiftwidth=2
set showmatch
set hlsearch
set incsearch

" Indentation
filetype plugin indent on
"set autoindent
"
" Always show status line
set laststatus=2

" Syntax
syntax on
syntax enable
set nocompatible
set t_Co=256
set number
set scrolloff=4
set mouse=nicr
set ttymouse=sgr
set clipboard=unnamed

" Theme
let g:solarized_termtrans = 1
set background=dark
let g:solarized_termcolors=256
"colorscheme solarized

" Status Line
set statusline+=%2*%y%* " file type (bold)(azure/dark gray)
set statusline+=%1*\ %<%F%* " full path (bold)(white/dark gray)
set statusline+=%4*%m%* " modified flag (bold)(red/dark gray)
set statusline+=%5*%=%5l%* " current line (bold)(cyan/dark gray)
set statusline+=%4*/%L%* " total lines (bold)(red/dark gray)

let mapleader = " "

" Key Mappings
nnoremap <F6> :wa<CR>
nnoremap <C-left> :tabp<CR>
nnoremap <C-right> :tabn<CR>
nnoremap <F9> :noh<CR>
map <C-n> :NERDTreeToggle<CR>

" Remove search highlights
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" Insert newline and stay in normal mode
nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>

map <Leader>b :TagbarToggle<CR>
map <Leader>h :tabp<CR>
map <Leader>l :tabn<CR>
map <Leader>n :tabedit<CR>
map <Leader>p :Tput<CR>
map <Leader>q :q<CR>
map <Leader>r :Twrite right<CR>
map <Leader>t :CommandT<CR>
map <Leader>w :w<CR>
map <Leader>x :x<CR>
map <Leader>y :Tyank<CR>
map <Leader>Q :qa!<CR>
map <Leader>W :wa<CR>
map <Leader>X :xa<CR>

vnoremap y "*y

" Auto Complete
inoremap <C-Space> <C-X><C-O>

imap <C-@> <C-Space>
imap <S-Space> <C-@>


" Split settings and mappings
set splitbelow
set splitright
map <Leader>k :vsp<CR>
map <Leader>j :sp<CR>

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

if !has("gui_running")
    :source $VIMRUNTIME/menu.vim
    :set wildmenu
    :set cpoptions-=<
    :map <F4> :emenu <C-Z>
endif

au BufRead,BufNewFile *.hb set filetype=html
au BufRead,BufNewFile *.us set filetype=html
au BufRead,BufNewFile *.es6 set filetype=javascript

set restorescreen!
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType markdown,md let tw = 100

" Colors
highlight Pmenu ctermbg=147 gui=bold

set tags=./tags;
call pathogen#helptags()

" Git Gutter Settings so as not to affect load times
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 200  " default value

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 0 " Don't check when opening
let g:syntastic_check_on_wq = 1 " Always check when saving
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 0 " Don't use signs?
let g:syntastic_loc_list_height = 5

" let g:airline#extensions#tabline#enabled = 1

let g:airline_theme="understated"
let g:airline_powerline_fonts=1
let g:airline_section_a = airline#section#create(['mode', ' ','branch', 'hunks'])

runtime macros/matchit.vim
let g:syntastic_html_tidy_ignore_errors = [
    \  '<template> is not recognized!',
    \  'discarding unexpected <template>',
    \  "plain text isn't allowed in <tbody> elements",
    \  'missing quote mark for attribute value',
    \ ]

let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }
let g:tmuxline_preset = {
      \'a'    : 'TMUX',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%r', '%a', '%Y'],
      \'z'    : '#H'}

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

let g:UltiSnipsExpandTrigger="<C-e>"

" Allow easy toggling between relative and absolute numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set no relativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>m :call NumberToggle()<cr>
" Set relative numbers as the default
set relativenumber
