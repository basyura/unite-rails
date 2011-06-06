"
" gather candidates
"
function! unite#sources#rails#javascript#candidates(source)
  let target = a:source.source__rails_root . '/public/javascripts'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
