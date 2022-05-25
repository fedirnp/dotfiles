set ai
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set nocompatible
set number
set laststatus=2
set statusline=%f
set updatetime=500

" Allows to use mouse to resize splits
set mouse=a

" set autochdir

scriptencoding utf-8
set encoding=utf-8

" This is to avoid delay when pressing "O" when the last key
" pressed was ESC
set ttimeoutlen=100

" --------------------------------------
" The following is copied from Mitchel H. vim configuration:
" https://github.com/mitchellh/dotfiles/blob/main/nvim/init.vim
"
" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Shortcut to yanking to the system clipboard
" map ;y "+y
" map ;P "+p

" Get rid of search highlights
noremap <silent><leader>/ :nohlsearch<cr>

" cd to the directory containing the file in the buffer.
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e

" Command to write as root if we dont' have permission
cmap w!! %!sudo tee > /dev/null %
" --------------------------------------

" colorscheme desert

" This should install vim-plug automatically
" when it is not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

   Plug 'morhetz/gruvbox'

   Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
   Plug 'ctrlpvim/ctrlp.vim'

   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   Plug 'junegunn/fzf.vim'

   Plug 'tpope/vim-commentary'
   Plug 'tpope/vim-fugitive'

   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'LnL7/vim-nix'

   Plug 'dense-analysis/ale'

   if executable('node')
       Plug 'neoclide/coc.nvim', {'branch': 'release'}
       let coc_loaded = 1
    endif

" Initialize plugin system
call plug#end()

if exists('coc_loaded')
    " Always show the signcolumn, otherwise it would shift the text each time
      set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif

" Disable re-formatting paste when in insert mode (using C-r)
set paste

let g:ale_fix_on_save = 1
let g:ale_fixers = {
     \ 'javascript': ['eslint'],
     \ 'vue': ['eslint']
     \ }

" Use 'fd' instead of find for fzf to respect .gitignore if it exists
" so :Files respect .gitignore
if executable('fd')
	let $FZF_DEFAULT_COMMAND='fd --type f'
endif

map <F2> :w<CR>
inoremap <F2> <c-o>:w<cr>

nnoremap <Leader>g :GoDef<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>o :CtrlPBuffer<CR>

autocmd FileType go nmap <leader>r  <Plug>(go-rename)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

" Configuration for airline
set t_Co=256
let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_dark = "hard"
" let g:molokai_original = 1
let g:ctrlp_working_path_mode = 'ra'

set bg=dark
colorscheme gruvbox
" colorscheme codedark
" coc autocomplete

set langmap=ж;;
set langmap=\'`,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,є',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,\'~,ЙQ,ЦW,УE,КR,ЕT,HY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Є\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<

