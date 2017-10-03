"
" gather candidates
"
function! unite#sources#rails#collector#minitest#candidates(source)
  let target = a:source.source__rails_root . '/test'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
