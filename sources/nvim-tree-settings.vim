"https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
lua require'nvim-tree'.setup {
            \ sort_by = "case_sensitive",
            \ open_on_setup = false,
            \ hijack_cursor = true,
            \ open_on_setup_file = false,
            \ view = {
                \ side = "left",
                \ signcolumn = "no",
                \ relativenumber = true,
                \ mappings = {
                    \ list = {
                        \ { key = "H", action = "" },
                        \ { key = "s", action = "" },
                        \ { key = "S", action = "" },
                        \ { key = "o", action = "system_open" },
                    \ },
                \ },
            \  },
            \ respect_buf_cwd = false,
            \ actions = {
                \ open_file = {
                \    quit_on_open = true,
                \    window_picker = {
                        \enable = true,
                    \}
                \},
            \},
            \ update_focused_file = 
                \ { 
                    \ enable=false, 
                \ },
        \ }

lua require'nvim-web-devicons'.get_icons()

nnoremap <F2> :NvimTreeFindFile<CR>
