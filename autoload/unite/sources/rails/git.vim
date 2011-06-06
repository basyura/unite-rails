let s:arguments = [
      \ ]
"
" gather candidates
"
function! unite#sources#rails#git#candidates(source)
  return unite#sources#rails#gather_candidates_cmd('git' , s:arguments)
endfunction

