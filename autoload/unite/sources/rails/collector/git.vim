let s:arguments = [
      \ ]
"
" gather candidates
"
function! unite#sources#rails#collector#git#candidates(source)
  return unite#sources#rails#gather_candidates_cmd('git' , s:arguments)
endfunction

