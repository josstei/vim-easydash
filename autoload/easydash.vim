let s:dashboard  = []

function! easydash#Open() abort
    call easydash#buffer#Create()
    call easydash#Build()
    call easydash#Draw()
endfunction

function! easydash#Build() abort
    if empty(s:dashboard)
        call extend(s:dashboard,g:easydash_logo)
        call extend(s:dashboard,call('easydash#menu#options', [g:easydash_options]))
        call extend(s:dashboard,g:easydash_extras)
    endif
endfunction

function! easydash#Clear() abort
    silent! %delete _
endfunction

function! easydash#Draw() abort
    setlocal modifiable
    call easydash#Clear()
    call easydash#Print()
    call cursor(1, 1)
    setlocal nomodifiable
endfunction

function! easydash#Print() abort
    let s:pad_top   = max([0, float2nr((winheight(0) - len(s:dashboard)) / 2)])
    let s:width     = winwidth(0)
    let l:dashboard = map(copy(s:dashboard), {_, val -> repeat(' ', float2nr((s:width - strwidth(val)) / 2)) . val})

    call append(0, repeat([''], s:pad_top) + l:dashboard)
endfunction

function! easydash#Resize() abort
    for winnr in range(1, winnr('$'))
        let bufnr = winbufnr(winnr)
        if getbufvar(bufnr, '&filetype') ==# 'easydash'
            let curwin = winnr()
            execute winnr . 'wincmd w'
            call easydash#Draw()
            execute curwin . 'wincmd w'
        endif
    endfor
endfunction
