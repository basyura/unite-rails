let s:arguments = [
      \ ]
"
" gather candidates
"
function! unite#sources#rails#heroku#candidates(source)
  return unite#sources#rails#gather_candidates_cmd('heroku' , s:arguments)
endfunction

