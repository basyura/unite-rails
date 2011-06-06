"
" gather candidates
"
function! unite#sources#rails#schema#candidates(source)
  let target = a:source.source__rails_root . '/db/schema.rb'
  return unite#sources#rails#gather_candidates_file(target)
endfunction
