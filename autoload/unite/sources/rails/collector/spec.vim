"
" gather candidates
"
function! unite#sources#rails#collector#spec#candidates(source)
  let target = a:source.source__rails_root . '/spec'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
