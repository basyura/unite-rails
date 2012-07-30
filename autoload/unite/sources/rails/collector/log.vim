"
" gather candidates
"
function! unite#sources#rails#collector#log#candidates(source)
  let target = a:source.source__rails_root . '/log'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
