if exists('g:easydash_loaded') | finish | endif

let g:easydash_loaded = 1 |

if !exists('g:easydash_name')
    let g:easydash_name = 'EasyDash'
endif

if !exists('g:easydash_logo')
    let g:easydash_logo = [
            \ '',
            \ '·······················································',
            \ ':      ____                ______          _          :',
            \ ':     |  __|               |  _  \        | |         :',
            \ ':     | |__  ____ ___ _   _| | | |____ ___| |___      :',
            \ ':     |  __|/ _  / __| | | | | | / _  / __| __  \     :',
            \ ':     | |__| (_| \__ \ |_| | |/ / (_| \__ \ | | |     :',
            \ ':     \____/\____|___/\__. |___/ \____|___/_| |_|     :',
            \ ':                      __/ |                          :',
            \ ':                     |___/                           :',
            \ '·······················································',
            \ '',
            \ ]
endif

autocmd VimEnter * if argc() == 0 |  call easydash#Open() | endif

augroup EasyDashAutoCenter 
    autocmd!
    autocmd VimResized,WinEnter,BufWinEnter * call easydash#Resize()
augroup END
