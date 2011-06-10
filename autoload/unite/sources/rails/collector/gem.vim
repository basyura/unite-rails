"
" gather gem's soruces
"
let s:arguments_cmd   = [
      \ {'word' : '--help'    },
      \ {'word' : '--version' },
      \ {'word' : 'list'      },
      \ ]
let s:arguments_input = [
      \ {'word' : 'install'   },
      \ {'word' : 'build'     },
      \ {'word' : 'help'      },
      \ ]
"
" gather candidates
"
function! unite#sources#rails#collector#gem#candidates(source)
  let cmd   = unite#sources#rails#helper#gather_candidates_cmd('gem' , s:arguments_cmd)
  let input = unite#sources#rails#helper#gather_candidates_cmd_input('gem' , s:arguments_input)
  return cmd + input
endfunction

