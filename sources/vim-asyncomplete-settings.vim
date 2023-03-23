"SETTINGS
"
"Every completion can be chosen by SHFT/SHIFT-TAB
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"If you prefer the enter key to always insert a new line 
"(even if the popup menu is visible) then you can amend 
"the above mapping as follows:
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

" force refresh
imap <c-space> <Plug>(asyncomplete_force_refresh)

" By default asyncomplete will automatically show the autocomplete popup 
" menu as you start typing. If you would like to disable the 
" default behavior set g:asyncomplete_auto_popup to 0
" let g:asyncomplete_auto_popup = 0

" To enable preview window
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview
