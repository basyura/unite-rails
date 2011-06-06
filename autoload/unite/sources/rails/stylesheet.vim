"
" gather candidates
"
function! unite#sources#rails#stylesheet#candidates(source)
  let target = a:source.source__rails_root . '/public/stylesheets'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
