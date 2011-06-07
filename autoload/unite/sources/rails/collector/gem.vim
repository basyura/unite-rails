let s:arguments = [
      \ ]
"
" gather candidates
"
function! unite#sources#rails#gem#collector#candidates(source)
  return unite#sources#rails#helper#gather_candidates_cmd('gem' , s:arguments)
endfunction

