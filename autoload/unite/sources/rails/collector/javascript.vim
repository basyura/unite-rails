"
" gather candidates
"
function! unite#sources#rails#collector#javascript#candidates(source)
  let target = a:source.source__rails_root . '/app/assets/javascripts'
  if !isdirectory(target)
    let target = a:source.source__rails_root . '/public/javascripts'
  endif
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
