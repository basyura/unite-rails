"
" gather candidates
"
function! unite#sources#rails#collector#webpack#candidates(source)
  let target = a:source.source__rails_root . '/app/javascript'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
