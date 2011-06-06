"
" gather candidates
"
function! unite#sources#rails#initializer#candidates(source)
  let target = a:source.source__rails_root . '/config/initializers'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
