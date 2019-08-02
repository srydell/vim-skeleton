" Modified by Simon Rydell originally by Noah Frederick

" Try to expand the snippet named _skel
function! s:try_insert(skel)
  execute 'normal! i_' . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"

  if g:ulti_expand_res == 0
    silent! undo
  endif

  return g:ulti_expand_res
endfunction

""
" Make u undo twice (temporarily) to work around UltiSnip's undo-breaking
" anti-feature.
function! s:install_undo_workaround() abort
  nnoremap <silent><buffer> u :call <SID>undo_workaround()<CR>
endfunction

function! s:undo_workaround() abort
  normal! 2u
  nunmap <buffer> u
endfunction

function! snippet#insert_skeleton() abort
  " Abort on non-empty buffer or extant file
  if !exists('g:did_plugin_ultisnips') || !(line('$') ==# 1 && getline('$') ==# '') || filereadable(expand('%:p'))
    return
  endif

  " Checks if there are any project specific skeletons
  " This is set by the Tim Pope plugin 'projectionist'
  if !empty(b:projectionist)
    " Loop through projections with 'skeleton' key
    " and try each one until the snippet expands
    for [root, value] in projectionist#query('skeleton')
      if s:try_insert(value)
        call s:install_undo_workaround()
        return
      endif
    endfor
  endif

  " If the current filename is in s:filenames_and_snippets,
  " then insert that snippet,
  " otherwise try generic _skel template
  if s:try_insert('skel')
    call s:install_undo_workaround()
  endif
endfunction
