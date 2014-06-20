function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let winview = winsaveview()
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    call winrestview(winview)	
endfunction

function! PreserveSave()
    let b:winview = winsaveview()
endfunction

function! PreserveRestore()
    if exists('b:winview')
        call winrestview(b:winview)	
        unlet b:winview
    else
        throw "Use :PreserveSave, before :PreserveRestore"
    endif
endfunction

if !exists(":PreserveSave")
    command! -bar -nargs=0 PreserveSave call PreserveSave()
endif

if !exists(":PreserveRestore")
    command! -bar -nargs=0 PreserveRestore call PreserveRestore()
endif


"examples:
" strip trailing whitespace with mapping  nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" fix indentation from command line :call Preserve("normal gg=G")
"rot13 whole file :call Preserve("ggg?G")

"my current mappings, comment out if you don't want to use them
"fix indentation
nmap <silent> <Leader>G :call Preserve("normal gg=G")<CR>
" Removes trailing whitespace
nmap <silent> <Leader>w :call Preserve("%s/\\s\\+$//e")<CR>


