"vim-test settings

" Ctrl O let you navigate the result of tests, default is C-\ + C-n (when you
" comment this cond. statement)
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" let test#python#runner = 'pytest'
let test#python#runner = 'djangotest'
" let test#python#pytest#executable='docker-compose exec web py.test'

let test#javascript#runner = 'jest'
let g:test#javascript#jest#executable = 'jest'
" let g:test#javascript#jest#executable = 'jest tests'
" let g:test#javascript#jest#options = '--verbose --reporters jest-vim-reporter'
" let g:test#javascript#jest#options = '--config jest.config.json'

" expand("%:p:h") <- returns the current directory
" do not use forward slash(/) in using folder separators in Windows
let test#php#runner='phpunit'
" DEFAULT location of phpunit
" let g:test#php#phpunit#executable = 'vendor\bin\phpunit'

" special cases for ci-php-unit-test
" let g:test#php#phpunit#executable = '..\..\vendor\bin\phpunit'
let g:test#php#phpunit#executable = 'vendor\bin\phpunit'
let g:test#php#phpunit#options = '--no-coverage'

let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'neovim',
\}


let g:test#preserve_screen = 1
" let test#neovim#term_position = "vert botright 60"

nnoremap <leader>tt :TestNearest<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ts :TestSuite<cr>
nnoremap <leader>tv :TestVisit<cr>
