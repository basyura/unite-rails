"
" gather candidates
"
function! unite#sources#rails#collector#stylesheet#candidates(source)
  let target = a:source.source__rails_root . '/app/assets/stylesheets'
  if !isdirectory(target)
    let target = a:source.source__rails_root . '/public/stylesheets'
  endif
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
