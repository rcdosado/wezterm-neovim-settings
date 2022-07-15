map <silent> <leader>W :lua require('nvim-window').pick()<CR>
lua require('nvim-window').setup({
            \ normal_hl = 'BlackOnLightYellow',
            \ hint_hl = 'Bold',
            \ border = 'none'
            \ })

hi BlackOnLightYellow guifg=#000000 guibg=#f2de91
