syntax on

set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'blueyed/vim-diminactive'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()


colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

let loaded_matchparen = 1
let mapleader = " "

let g:airline#extensions#tabline#enabled = 1
let g:fzf_layout = { 'window': { 'window': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }

map <C-\> :NERDTreeToggle<CR>
map <C-/> :TagbarToggle<CR>

nnoremap <leader>h :wincmd h<CR>
let g:gitgutter_map_keys = 0
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>


