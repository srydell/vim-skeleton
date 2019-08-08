" Location: after/plugin/ultisnipsCustom.vim
" Author: Modified by Simon Rydell originally by Noah Frederick

if exists('g:after_plugin_ultisnipsCustom')
  finish
endif
let g:after_plugin_ultisnipsCustom = 1

" Check if UltiSnips is loaded
if !(exists('g:UltiSnipsExpandTrigger') || (has('python') && has('python3')))
  finish
endif

augroup ultisnips_custom
  autocmd!
  " Try and expand a skeleton upon a new file
  autocmd BufNewFile * silent! call snippet#insert_skeleton()
augroup END
