map <silent> <leader>w :lua require('nvim-window').pick()<CR>
lua << EOF
local nv = require "nvim-window"
nv.setup{
             normal_hl = 'BlackOnLightYellow',
             hint_hl = 'Bold',
             border = 'none'
}
EOF

hi BlackOnLightYellow guifg=#000000 guibg=#f2de91

