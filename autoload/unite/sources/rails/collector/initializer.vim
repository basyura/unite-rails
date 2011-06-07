"
" gather candidates
"
function! unite#sources#rails#collector#initializer#candidates(source)
  let target = a:source.source__rails_root . '/config/initializers'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
