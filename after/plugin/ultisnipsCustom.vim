" Modified by Simon Rydell originally from Noah Frederick

" Check if UltiSnips is loaded
if !(exists('g:UltiSnipsExpandTrigger') || (has('python') && has('python3')))
  finish
endif

augroup ultisnips_custom
  autocmd!
  " Try and expand a skeleton upon a new file
  autocmd BufNewFile * silent! call snippet#insert_skeleton()
augroup END
