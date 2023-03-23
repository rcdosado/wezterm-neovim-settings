" https://neovim.io/doc/user/quickref.html
set encoding=UTF-8
set linebreak
set termguicolors
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
set formatoptions-=cro
" set list
set number
set relativenumber
" set invnumber list!

call plug#begin('~\AppData\Local\nvim\plugins')

Plug 'kyazdani42/nvim-tree.lua'
Plug 'cohama/lexima.vim'
Plug 'kylechui/nvim-surround'
Plug 'ggandor/leap.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'windwp/nvim-autopairs'

"startifier
Plug 'mhinz/vim-startify'

"keyboard
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }


" profile startup time
Plug 'dstein64/vim-startuptime'

" status line
Plug 'nvim-lualine/lualine.nvim'
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" indent guide
Plug 'lukas-reineke/indent-blankline.nvim'

"Tags 
Plug 'liuchengxu/vista.vim'
" Plug 'ludovicchabant/vim-gutentags'

"Wiki
" Plug 'vimwiki/vimwiki'

"window manager 
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'

Plug 'junegunn/vim-easy-align'

Plug 'sbdchd/neoformat'

" make sure its compatible with deoplete
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" language servers
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"Auto completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

"testers 
Plug 'vim-test/vim-test'

" minimalists themes
Plug 'sjl/badwolf'
Plug 'robertmeta/nofrils'

" schemes / themes / uncomment to enable third party themes
source ~/Appdata/Local/nvim/sources/themes-plugs.vim

call plug#end()

let mapleader=" "

" save your custom snippets here
let g:vsnip_snippet_dirs = ['~/Appdata/Local/nvim/snippets']


let g:gutentags_generate_on_write=1

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" au ColorScheme * hi Normal ctermbg=None

" turn off to reveal true colors, enable transparency
" highlight Normal guibg=none

" THEMES
set background=dark
" set background=light
"
" editplus, paramount, tokyonight, shades_of_purple
" badwolf, moonfly, dracula, nord, leaf, nightfox
" dawnfox, dayfox, duskfox, nordfox, terafox, carbonfox
" nofrils-dark light sepia acme, papercolor, murphy
" gruvbox, nighfly,kanagawa, solarized, minimalist
" purify, catppuccin, cobalt2

colorscheme cobalt2
" let g:catppuccin_flavour = "frappe" " dusk, latte, frappe, macchiato, mocha


" change working directory to the location of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


set hidden
" set undofile
" set undodir="~/AppData/Local/nvim-data/undo"
" set history=1000
" set undolevels=1000

"resize windows
nnoremap <leader>. :vertical resize +20<CR>
nnoremap <leader>, :vertical resize -20<CR>
nnoremap <leader>= :resize +5<CR>
nnoremap <leader>- :resize -5<CR>

"switch buffers 
nnoremap <Leader>b :ls<CR>:b<Space>

"browse old files
nmap <silent> <leader>m :History<CR>

"init
lua require('leap').set_default_keymaps()
" lua require('bufferline').setup()
lua require("nvim-autopairs").setup {}
lua require'nvim-web-devicons'.get_icons()

let g:python3_host_prog='~/Appdata/Local/nvim/env39/Scripts/python.exe'
let g:loaded_ruby_provider = 0
let g:indent_blankline_enabled = 0

nnoremap <leader>zz :source $MYVIMRC<cr> 

"TOGGLES
nnoremap L :Vista!!<cr>
nnoremap H :NvimTreeToggle<cr>

" https://vim.fandom.com/wiki/Insert_current_date_or_time
" nnoremap <S-F5> :pu=strftime('%a %d %b %Y')<CR>
nnoremap <S-F5> :pu=strftime('%c')<CR>


nmap <F3> :IndentBlanklineToggle<cr>
nmap <F5> :set list!<cr>

" choose toggles here for line numbers
nmap <F6> :set relativenumber!<cr>
" nmap <F6> :set relativenumber!<cr>


" formatting option for this file types
autocmd Filetype html,ruby,javascript,yml,yaml,json,haskell,ejs,htmldjango,django setlocal ts=2 sts=2 sw=2

" topmost
map <leader><leader> zt

" Easy insertion of a  ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap OO <Esc>A;<Esc>o
imap ,, <Esc>A,<Esc><CR>



"" After searching, pressing escape stops the highlight
nnoremap <silent> <esc> :noh<cr><esc>

" wopen
nnoremap <leader>en : enew<CR>
nnoremap <leader>ev : e $MYVIMRC<cr>
nnoremap <leader>eV : tabnew $MYVIMRC<cr>
nnoremap <leader>eW : tabnew c:/docs/notes/index.md<cr>
nnoremap <leader>es : tabnew c:/docs/notes/etc.txt<cr>
nnoremap <leader>ew : tabnew ~\Appdata\Local\nvim\wezterm.lua<cr>
nnoremap <leader>et : tabnew ~\AppData\Local\nvim\sources\vim-test-settings.vim<CR>
nnoremap <leader>em : tabnew ~\AppData\Local\nvim\sources\themes-plugs.vim<CR>
nnoremap <leader>ef : tabnew c:\users\rag\files\cyrish.txt<CR>
nnoremap <leader>ed : e c:/Users/RAG/Desktop/downloads.txt<CR>
nnoremap <leader>ek : e C:/docs/notes/CheatSheets/shortcuts.md<CR>
" nnoremap <leader>V :vsp $myvimrc<cr>

" Easy select all of file
" nnoremap <leader>sa ggvG<c-$>
nnoremap <leader>sa <esc>ggVG<CR> 

"use jj to exit insert mode
" imap jj <Esc>
autocmd FileType html nnoremap ff vat
autocmd FileType php,c nnoremap ff vi{



" Remap H and L to switch tabs left or right
" nnoremap H :bprev<cr>
" nnoremap L :bnext<cr>

nnoremap J <c-f>
nnoremap K <c-b>


" Saving file
noremap <C-S> :update<cr>
vnoremap <C-S> <C-C>:update<cr>
inoremap <C-S> <C-O>:update<cr>

" This code auto source init.vim when saved
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" close all buffers except current, call BufCurOnly
command! BufCurOnly execute '%bdelete|edit#|bdelete#'

" search for the current visual selection
vnoremap * "zy:let @/=@z<C-r>n

" take yanked word and place in search and replace
" nnoremap <Tab><Tab> :%s/<C-r>"/<C-r>"/g\|''<Left><Left><Left><Left><Left>

" copy paste
set clipboard^=unnamed,unnamedplus
" remap paste key so it always paste below cursor  
" nmap p :pu<CR>
 

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
" NVIM_TREE SETTINGS
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
" NERDCOMMENTER SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/nerdcommenter-settings.vim

""""""""""""""""""""""""""""""""""""
" VISTA SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vista-settings.vim

""""""""""""""""""""""""""""""""""""
" VIMWIKI SETTINGS
""""""""""""""""""""""""""""""""""""
" source ~/Appdata/Local/nvim/sources/vimwiki-settings.vim

" NEOFORMAT SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/neoformat-settings.vim
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" NVIM-WINDOW  SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/nvim-window-settings.vim

""""""""""""""""""""""""""""""""""""
" VIM-TEST SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-test-settings.vim

""""""""""""""""""""""""""""""""""""
" LEXIMA SETTINGS
""""""""""""""""""""""""""""""""""""
" source ~/Appdata/Local/nvim/sources/lexima-settings.vim

""""""""""""""""""""""""""""""""""""
" VIM-SNIP SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-snip-settings.vim

""""""""""""""""""""""""""""""""""""
" VIM-STARTIFY SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-startify-settings.vim

""""""""""""""""""""""""""""""""""""
" VIM-STARTIFY SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-easy-align-settings.vim

""""""""""""""""""""""""""""""""""""
" VIM-LSP SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-lsp-settings.vim

""""""""""""""""""""""""""""""""""""
" VIM-ASYNCOMPLETE SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/vim-asyncomplete-settings.vim

""""""""""""""""""""""""""""""""""""
" NVIM-AUTOPAIRS SETTINGS
""""""""""""""""""""""""""""""""""""
source ~/Appdata/Local/nvim/sources/nvim-autopairs-settings.vim
