"
" gather candidates
"
function! unite#sources#rails#collector#job#candidates(source)
  let target = a:source.source__rails_root . '/app/jobs'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
