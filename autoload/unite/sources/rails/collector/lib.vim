"
" gather candidates
"
function! unite#sources#rails#collector#lib#candidates(source)
  let target = a:source.source__rails_root . '/lib'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
