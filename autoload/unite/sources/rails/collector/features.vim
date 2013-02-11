"
" gather candidates
"
function! unite#sources#rails#collector#features#candidates(source)
  let target = a:source.source__rails_root . '/features'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
