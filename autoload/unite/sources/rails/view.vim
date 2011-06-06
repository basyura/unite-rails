"
" gather candidates
"
function! unite#sources#rails#view#candidates(source)
  let target = a:source.source__rails_root . '/app/views'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
