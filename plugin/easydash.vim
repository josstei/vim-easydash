if exists('g:easydash_loaded') | finish | endif
let g:easydash_loaded= 1

autocmd VimEnter * if argc() == 0 && !exists('g:easydash_loaded') |
      \ let g:easydash_loaded = 1 |
      \ call easydash#Open() |
      \ endif

augroup EasyDashAutoCenter 
    autocmd!
    autocmd VimResized,WinEnter,BufWinEnter * call easydash#Resize()
augroup END
