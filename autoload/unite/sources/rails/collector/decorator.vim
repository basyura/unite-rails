"
" gather candidates
"
function! unite#sources#rails#collector#decorator#candidates(source)
  let target = a:source.source__rails_root . '/app/decorators'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction

