"
" gather candidates
"
function! unite#sources#rails#model#candidates(source)
  let target = a:source.source__rails_root . '/app/models'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
