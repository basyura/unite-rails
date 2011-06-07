"
" gather candidates
"
function! unite#sources#rails#collector#config#candidates(source)
  let target = a:source.source__rails_root . '/config'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
