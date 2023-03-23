" whether to enable diagnostics for vim-lsp (we may want to use ALE for other
" plugins for that.
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

" show diagnostic signs
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '!'}
let g:lsp_highlights_enabled = 0

" Do not use virtual text, they are far too obtrusive.
let g:lsp_virtual_text_enabled = 0
" echo a diagnostic message at cursor position
let g:lsp_diagnostics_echo_cursor = 1
" show diagnostic in floating window
let g:lsp_diagnostics_float_cursor = 1
" whether to enable highlight a symbol and its references
let g:lsp_highlight_references_enabled = 1
let g:lsp_preview_max_width = 80

" ---------------------------------------------------------------
"
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
"
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" ---------------------------------------------------------------
