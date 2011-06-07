"
" gather candidates
"
function! unite#sources#rails#collector#route#candidates(source)
  let target = a:source.source__rails_root . '/config/routes.rb'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
