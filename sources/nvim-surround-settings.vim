""""""""""""""""""""""""""""""""""""
" NVIM SURROUND SETTINGS
""""""""""""""""""""""""""""""""""""
lua require("nvim-surround").setup({
        \keymaps = {
            \insert = "ys",
                \insert_line = "yss",
                \visual = "W",
                \delete = "ds",
                \change = "cs",
            \},
        \})



