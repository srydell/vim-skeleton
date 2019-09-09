" Location: after/plugin/skeleton.vim
" Author: Modified by Simon Rydell originally by Noah Frederick

if exists('g:after_plugin_skeleton')
  finish
endif
let g:after_plugin_skeleton = 1

" Check if UltiSnips is loaded
if !(exists('g:UltiSnipsExpandTrigger') || (has('python') && has('python3')))
  finish
endif

augroup plugin_vim_skeleton
  autocmd!
  " Try and expand a skeleton upon a new file
  autocmd BufNewFile * silent! call skeleton#insert_skeleton()
augroup END
