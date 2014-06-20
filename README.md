Preserve.vim
============

Preserve function plus a few suggested uses
<Leader>G :call Preserve("normal gg=G")<CR>
Removes trailing whitespace
<Leader>w :call Preserve("%s/\\s\\+$//e")<CR>
Highlight and Search for word under the cursor without changing the cursor position
nnoremap <silent> *  :PreserveSave<CR>:normal! *N<CR>:set hlsearch<CR>:PreserveRestore<CR>


Spoke to Drew Neil and Johnathan Palardy on twitter, who came up with with the preserve trick and made it a function, respectifvely, and they are cool with this.
