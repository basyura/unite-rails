"
" gather candidates
"
function! unite#sources#rails#mailer#candidates(source)
  let target = a:source.source__rails_root . '/app/mailers'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
