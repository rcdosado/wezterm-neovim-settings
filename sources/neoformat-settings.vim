nnoremap <silent> <leader>F :Neoformat<CR>
let g:neoformat_verbose = 0 " only affects the verbosity of Neoformat
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_php = ['prettier']

" SAMPLE
" let g:neoformat_python_autopep8 = {
"             \ 'exe': 'autopep8',
"             \ 'args': ['-s 4', '-E'],
"             \ 'replace': 1, " replace the file, instead of updating buffer (default: 0)
"             \ 'stdin': 1, " send data to stdin of formatter (default: 0)
"             \ 'env': ["DEBUG=1"], " prepend environment variables to formatter command
"             \ 'valid_exit_codes': [0, 23],
"             \ 'no_append': 1,
"             \ }
