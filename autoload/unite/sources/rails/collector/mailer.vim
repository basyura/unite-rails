"
" gather candidates
"
function! unite#sources#rails#collector#mailer#candidates(source)
  let target = a:source.source__rails_root . '/app/mailers'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
