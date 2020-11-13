syntax on

set guicursor=
set relativenumber
"set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
"set expandtab
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
Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar' "not working...
Plug 'vim-airline/vim-airline'

"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'blueyed/vim-diminactive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mileszs/ack.vim'

"Color Scheme"
Plug 'gruvbox-community/gruvbox'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'colepeters/spacemacs-theme.vim'

"Plug 'sainnhe/gruvbox-material' "somehow this is laggy
"Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

"lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"lsp code snippet
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'prabirshrestha/async.vim'
"Plug 'thomasfaingnaert/vim-lsp-snippets'
"Plug 'thomasfaingnaert/vim-lsp-ultisnips'

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

" s[char][char] search
Plug 'justinmk/vim-sneak'

" js minimalist (doesn't support ts, tsx yet) looks like it support jsx and
" js. Flow + js is the way to go.
Plug 'pangloss/vim-javascript'
Plug 'Wolfy87/vim-syntax-expand'

" Visual expand by block
Plug 'terryma/vim-expand-region'

" TMux setup
Plug 'tpope/vim-tbone'
Plug 'tmux-plugins/vim-tmux'
"Plug 'christoomey/vim-tmux-navigator'

" remove buffer except the current buffer
Plug 'schickling/vim-bufonly'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" <C-v> :I :II
Plug 'vim-scripts/VisIncr'
" % for match any closing and opening tags
Plug 'vim-scripts/matchit.zip'
"Plug 'vim-scripts/LustyJuggler'

"emmt-vim
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/HTML.zip'

"vim-surround and vim-repeat
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'ervandew/supertab'
Plug 'terryma/vim-expand-region'
Plug 'pangloss/vim-simplefold'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
highlight Normal ctermbg=0

set termguicolors
set background=dark

let loaded_matchparen = 1
let mapleader = " "

let g:lsp_diagnostics_echo_cursor = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:fzf_layout = { 'window': { 'window': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }

let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
filetype plugin indent on

" block highlight mapping
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

let g:user_emmet_mode='in'  "enable all functions in insert and normal mode
let g:user_emmet_leader_key='<C-y>' "then type ,

"lsp code snippet config
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"if executable('clangd')
  "augroup vim_lsp_cpp
      "autocmd!
      "autocmd User lsp_setup call lsp#register_server({
                  "\ 'name': 'clangd',
                  "\ 'cmd': {server_info->['clangd']},
                  "\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                  "\ })
"autocmd FileType c,cpp,objc,objcpp,cc setlocal omnifunc=lsp#complete
  "augroup end
"endif
"set completeopt+=menuone

" if the complete popup is currently visible Tab works like <C-n> (not working
" for now)
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

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

"! conceal is not working
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1
"autocmd FileType javascript inoremap <silent> <buffer> @ <C-r>=syntax_expand#expand("@", "this")<CR>
"autocmd FileType javascript inoremap <silent> <buffer> # <C-r>=syntax_expand#expand("#", ".prototype.")<CR>
"autocmd FileType javascript inoremap <silent> <buffer> < <C-r>=syntax_expand#expand_head("<", "return")<CR>
"" Keeps everything concealed at all times. Even when my cursor is on the word.
"set conceallevel=1
"set concealcursor=nvic
" JavaScript thanks to pangloss/vim-javascript
let g:javascript_conceal_function = 'λ'
let g:javascript_conceal_return = '<'
let g:javascript_conceal_null = 'ø'
let g:javascript_conceal_this = '@'
let g:javascript_conceal_undefined = '¿'
let g:javascript_conceal_NaN = 'ℕ'
let g:javascript_conceal_prototype = '¶'
let g:javascript_conceal_static = '•'
let g:javascript_conceal_super = 'Ω'
let g:javascript_conceal_arrow_function = '⇒'

"let g:indentLine_noConcealCursor=""

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <C-\> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" window operationr
nnoremap <leader>h :wincmd h<CR>
let g:gitgutter_map_keys = 0
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <C-[> :bprevious<CR>
nnoremap <C-]> :bnext<CR>
nnoremap <leader>wo :BufOnly<CR>

"nerdtree operation
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string()<CR>
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

nmap <leader>a :tab split<CR>:Ack ""<Left>

nnoremap <Leader><CR> :so ~/.vim/vimrc<CR>

"Git Fugitie
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>gc :Git checkout<Space>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gp :Gpush<CR>
nnoremap <leader>go :<c-u>:Gwrite<bar>:Git add .<bar>:Gcommit -m upd<bar>Gpush<cr>

"Save Action
" nmap <leader>wo :wq<CR>
noremap <Leader>s :update<CR>

"search and replace
noremap <leader>fiw :CocSearch <C-R>=expand("<cword>")<CR><CR>
noremap <leader>fk :CocSearch<Space>
nnoremap <leader>r :%s///g<Left><Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left><Left>

nnoremap <leader>gd :LspDefinition<CR>

imap jj <Esc>

inoremap <esc>   <NOP>

let file_path = expand('%:p')
noremap gt :w !ts-node <c-r>=expand("%:p")<CR><CR>

xnoremap <leader>y "*y
