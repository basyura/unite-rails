let s:arguments = [
      \ ]
"
" gather candidates
"
function! unite#sources#rails#collector#git#candidates(source)
  return unite#sources#rails#helper#gather_candidates_cmd('git' , s:arguments)
endfunction

