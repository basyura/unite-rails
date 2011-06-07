let s:arguments = [
      \ ]
"
" gather candidates
"
function! unite#sources#rails#gem#collector#candidates(source)
  return unite#sources#rails#gather_candidates_cmd('gem' , s:arguments)
endfunction

