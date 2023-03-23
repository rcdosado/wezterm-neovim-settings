nnoremap gh :Startify<cr>
" https://gist.github.com/shaggyrogers/2c928108d1fa87ab4462fad9be99ebec
let s:startify_ascii_header = [
            \ '                                        ▟▙            ',
            \ '                                        ▝▘            ',
            \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
            \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
            \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
            \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
            \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
            \ '',
            \]

let g:startify_custom_header = map(s:startify_ascii_header +
            \ startify#fortune#quote(), '"   ".v:val')
"
let g:startify_bookmarks = [ '~/Appdata/local/nvim/init.vim']

" change to directory when opening file
let g:startify_change_to_dir = 1

" how many files to list
 let g:startify_files_number = 5

" go to root if detected git, hg, bzr and svn
let g:startify_change_to_vcs_root = 1

