" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1

" be explicit about whats running
let g:ale_set_balloons = 1

" be explicit about whats running
let g:ale_linters_explicit = 1

" keep side gutter open https://github.com/dense-analysis/ale#5ii-how-can-i-keep-the-sign-gutter-open
let g:ale_sign_column_always = 1

" run the linter only on these
let g:ale_linters = {
  \ 'html': ['eslint'],
  \ 'css': ['eslint'],
  \ 'json': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \}

let g:ale_fixers = {
  \ 'javascript': ['prettier', 'eslint'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'json': ['prettier', 'eslint'],
  \ 'markdown': ['prettier'],
  \ 'css': ['prettier'],
  \}
  " \ 'htmldjango': ['prettier'],

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'

" enable fix on save (prettier,refmt)
"let g:ale_fix_on_save = 1
" highlight ALEWarning ctermbg=DarkMagenta
