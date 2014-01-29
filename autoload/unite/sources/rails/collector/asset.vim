"
" gather candidates
"
function! unite#sources#rails#collector#asset#candidates(source)
  let target = a:source.source__rails_root . '/app/assets'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction

