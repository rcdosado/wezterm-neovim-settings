" https://neovim.io/doc/user/quickref.html
set encoding=UTF-8
set termguicolors
set linebreak
set noswapfile
set hlsearch
set ignorecase
set mouse=a
set scrolloff=8
set sidescrolloff=9
set updatetime=300
set redrawtime=10000
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
set showbreak=↪\
set listchars=tab:→\ ,trail:∙,eol:↲,nbsp:␣,extends:⟩,precedes:⟨
set wildignore=*.swp,*.bak,*.pyc,*.class
set shiftround
" set list
" set number
set relativenumber
" set invnumber list!

call plug#begin('~\AppData\Local\nvim\plugins')

Plug 'kyazdani42/nvim-tree.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'kylechui/nvim-surround'
Plug 'ggandor/lightspeed.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'

" profile startup time
Plug 'dstein64/vim-startuptime'

" status line
Plug 'nvim-lualine/lualine.nvim'

" indent guide
Plug 'lukas-reineke/indent-blankline.nvim'

"Tags 
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'

"Wiki
" Plug 'vimwiki/vimwiki'

"window manager 
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'

"Javascript
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] 
  \ }

" autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

"testers 
Plug 'vim-test/vim-test'

" schemes / themes / uncomment to enable third party themes
" source ~/Appdata/Local/nvim/sources/themes-plugs.vim

call plug#end()

let mapleader=" "
let g:deoplete#enable_at_startup = 1
let g:vsnip_snippet_dir="~/AppData/Local/nvim/plugins/friendly-snippets"

let g:gutentags_generate_on_write=1


" au ColorScheme * hi Normal ctermbg=None

" colorscheme editplus
colorscheme badwolf


"Undo stuff 
if has("persistent_undo")
    set undodir="~/AppData/Local/nvim-data/undo"
    set undofile
    set history=1000
    set undolevels=1000
endif

"resize windows
nnoremap <leader>. :vertical resize +20<CR>
nnoremap <leader>, :vertical resize -20<CR>
nnoremap <leader>= :wincmd +<CR>
nnoremap <leader>- :wincmd -<CR>

"switch buffers 
nnoremap <Leader>b :ls<CR>:b<Space>

" make background transparent
" highlight Normal guibg=none

lua require'lspconfig'.pyright.setup{}

let g:python3_host_prog='~/Appdata/Local/nvim/env39/Scripts/python.exe'
let g:loaded_ruby_provider = 0
let g:indent_blankline_enabled = 0

nnoremap <leader>zz :source $MYVIMRC<cr> 

"TOGGLES

nnoremap H :NvimTreeToggle<cr>
nmap <F3> :IndentBlanklineToggle<cr>
nmap <F5> :set list!<cr>

" choose toggles here for line numbers
" nmap <F6> :set number!<cr>
nmap <F6> :set relativenumber!<cr>

map <leader><leader> :bprevious<CR>

" formatting option for this file types
autocmd Filetype html,ruby,javascript,yml,yaml,json,haskell,ejs,htmldjango,django setlocal ts=2 sts=2 sw=2

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>o
imap ,, <Esc>A,<Esc>


"" After searching, pressing escape stops the highlight
nnoremap <silent> <esc> :noh<cr><esc>

" wopen
nnoremap <leader>en :enew<CR>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>eV :tabnew $MYVIMRC<cr>
nnoremap <leader>eW :tabnew c:/docs/notes/index.md<cr>
nnoremap <leader>es :tabnew c:/docs/notes/etc.txt<cr>
nnoremap <leader>ew :tabnew ~\Appdata\Local\nvim\wezterm.lua<cr>
nnoremap <leader>etest :tabnew ~\AppData\Local\nvim\sources\vim-test-settings.vim<CR>
nnoremap <leader>ed :e c:/Users/RAG/Desktop/downloads.txt<CR>
nnoremap <leader>em :tabnew ~\AppData\Local\nvim\sources\themes-plugs.vim<CR>
" nnoremap <leader>V :vsp $myvimrc<cr>

" Easy select all of file
nnoremap <leader>sa ggvG<c-$>

"use jj to exit insert mode
imap jj <Esc>

" move current location to topmost
nnoremap tt zt

" Remap H and L to switch tabs left or right
" nnoremap H :bprev<cr>
" nnoremap L :bnext<cr>

nnoremap J <c-f>
nnoremap K <c-b>
nnoremap L $

" Saving file
noremap <C-S> :update<cr>
vnoremap <C-S> <C-C>:update<cr>
inoremap <C-S> <C-O>:update<cr>

" This code auto source init.vim when saved
autocmd! BufWritePost $MYVIMRC source $MYVIMRC 

" close all buffers except current, call BufCurOnly
command! BufCurOnly execute '%bdelete|edit#|bdelete#'


" copy paste
set clipboard^=unnamed,unnamedplus

" go to next line during insert mode
" press Ctrl-o during insert mode
imap <C-o> <esc>o

" Close a buffer 
nnoremap <leader>x :bd!<cr>

" Close all buffer 
nnoremap <leader>X :%bd!<cr>

" quit all (dont save)
nnoremap <leader>Q :qall!<cr>

" map the key to close except the current buffer
nnoremap <leader>q :BufCurOnly<cr>

" SS

""""""""""""""""""""""""""""""""""""
" ThePrimeagen SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/theprimeagen-settings.vim

""""""""""""""""""""""""""""""""""""
" FZF SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/fzf-settings.vim

""""""""""""""""""""""""""""""""""""
" NVIM TREE SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/nvim-tree-settings.vim
""""""""""""""""""""""""""""""""""""
" VIM SURROUND SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/nvim-surround-settings.vim
""""""""""""""""""""""""""""""""""""
" EMMET VIM SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/emmet-vim-settings.vim
""""""""""""""""""""""""""""""""""""
" LUALINE SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/lualine-settings.vim
""""""""""""""""""""""""""""""""""""
" LIGHTSPEED SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/lightspeed-settings.vim
""""""""""""""""""""""""""""""""""""
" FUGITIVE SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/fugitive-settings.vim
""""""""""""""""""""""""""""""""""""
" VIM-SNIP SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-snip-settings.vim
""""""""""""""""""""""""""""""""""""
" ALE SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/ale-settings.vim
""""""""""""""""""""""""""""""""""""
" NERDCOMMENTER SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/nerdcommenter-settings.vim

""""""""""""""""""""""""""""""""""""
" DEOPLETE SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/deoplete-settings.vim

""""""""""""""""""""""""""""""""""""
" VISTA SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vista-settings.vim

""""""""""""""""""""""""""""""""""""
" VIMWIKI SETTINGS
""""""""""""""""""""""""""""""""""""
" source ~/Appdata/Local/nvim/sources/vimwiki-settings.vim

""""""""""""""""""""""""""""""""""""
" PRETTIER SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/prettier-settings.vim

""""""""""""""""""""""""""""""""""""
" NVIM-WINDOW  SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/nvim-window-settings.vim

""""""""""""""""""""""""""""""""""""
" VIM-TEST SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-test-settings.vim

""""""""""""""""""""""""""""""""""""
" AUTO-PAIRS SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/auto-pairs-settings.vim
