function! easydash#buffer#Create() abort
    enew
    execute 'file ' . g:easydash_name
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nonumber norelativenumber
    setlocal signcolumn=no
    setlocal foldcolumn=0
    setlocal cursorline
    setlocal modifiable
    setlocal filetype=easydash
endfunction
