syntax on

set guicursor=
set relativenumber
"set nohlsearch
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
set cursorline
set cursorcolumn
set splitright

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


call plug#begin('~/.vim/plugged')

"Basic
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar' "not working...
Plug 'vim-airline/vim-airline'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'blueyed/vim-diminactive'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mileszs/ack.vim'
"Color Scheme"
"Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'colepeters/spacemacs-theme.vim'
"Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
"lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"auto-complete"
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-lua/diagnostic-nvim'
"auto-linting
Plug 'dense-analysis/ale'
"vim game
Plug 'ThePrimeagen/vim-be-good'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" automatically clear search highlights after you move your cursor
Plug 'haya14busa/is.vim'

" Plug 'easymotion/vim-easymotion'

call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula
"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=darkgrey
"set background=dark
"let g:gruvbox_contrast_dark = 'hard'
"if exists('+termguicolors')
    "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif
"let g:gruvbox_invert_selection='0'

let loaded_matchparen = 1
let mapleader = " "

let g:lsp_diagnostics_echo_cursor = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:fzf_layout = { 'window': { 'window': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

let g:ale_fixers = {
      \'javascript': ['eslint'],
      \'json': ['prettier'],
      \'typescript': ['eslint'],
      \'typescriptreact': ['eslint'],
      \'markdown': ['prettier'],
      \'css': ['stylelint'],
      \'scss': ['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <C-\> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

nnoremap <leader>h :wincmd h<CR>
let g:gitgutter_map_keys = 0
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string()<CR>
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

nmap <leader>a :tab split<CR>:Ack ""<Left>

nnoremap <Leader><CR> :so ~/.vim/vimrc<CR>
nnoremap <C-[> :bprevious<CR>
nnoremap <C-]> :bnext<CR>
nnoremap <leader>q :bd<CR>

"Git Fugitie
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>gc :Git checkout<Space>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gp :Gpush<CR>
nnoremap <leader>go :<c-u>:Gwrite<bar>:Git add .<bar>:Gcommit -m upd<bar>Gpush<cr>

"Save Action
nmap <leader>wo :wq<CR>
noremap <Leader>s :update<CR>

"search and replace
noremap <leader>fiw :CocSearch <C-R>=expand("<cword>")<CR><CR>
noremap <leader>fk :CocSearch<Space>
nnoremap <leader>r :%s///g<Left><Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left><Left>

nnoremap <leader>gd :LspDefinition<CR>

imap jj <Esc>

inoremap <esc>   <NOP>
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

let file_path = expand('%:p')
noremap gt :w !ts-node <c-r>=expand("%:p")<CR><CR>

xnoremap <leader>y "*y
