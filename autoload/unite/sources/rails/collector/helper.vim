"
" gather candidates
"
function! unite#sources#rails#collector#helper#candidates(source)
  let target = a:source.source__rails_root . '/app/helpers'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
