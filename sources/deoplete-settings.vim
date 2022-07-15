
let g:deoplete#enable_at_startup = 1

"https://github.com/Shougo/deoplete.nvim/blob/378feff8772d0e9f9ef2c94284947f3666576500/doc/deoplete.txt
call deoplete#custom#option({
\ 'prev_completion_mode': "mirror",
\ })


" https://github.com/tbodt/deoplete-tabnine
" [tabnine]
call deoplete#custom#var('tabnine', {
    \ 'line_limit': 800,
    \ 'max_num_results': 5,
    \ })
