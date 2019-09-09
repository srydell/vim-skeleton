" Location: after/plugin/ultisnipsCustom.vim
" Author: Modified by Simon Rydell originally by Noah Frederick

if exists('g:after_plugin_template')
  finish
endif
let g:after_plugin_template = 1

" Check if UltiSnips is loaded
if !(exists('g:UltiSnipsExpandTrigger') || (has('python') && has('python3')))
  finish
endif

augroup ultisnips_custom
  autocmd!
  " Try and expand a skeleton upon a new file
  autocmd BufNewFile * silent! call skeleton#insert_skeleton()
augroup END
