"
" gather candidates
"
function! unite#sources#rails#log#candidates(source)
  let target = a:source.source__rails_root . '/log'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
