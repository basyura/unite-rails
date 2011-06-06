"
" gather candidates
"
function! unite#sources#rails#config#candidates(source)
  let target = a:source.source__rails_root . '/config'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
