"
" gather candidates
"
function! unite#sources#rails#collector#controller#candidates(source)
  let target = a:source.source__rails_root . '/app/controllers'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
