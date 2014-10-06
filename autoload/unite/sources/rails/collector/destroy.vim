let s:arguments = [
      \ {'word' : 'controller'          },
      \ {'word' : 'generator'           },
      \ {'word' : 'helper'              },
      \ {'word' : 'integration_test'    },
      \ {'word' : 'mailer'              },
      \ {'word' : 'migration'           },
      \ {'word' : 'model'               },
      \ {'word' : 'observer'            },
      \ {'word' : 'performance_test'    },
      \ {'word' : 'plugin'              },
      \ {'word' : 'resource'            },
      \ {'word' : 'scaffold'            },
      \ {'word' : 'scaffold_controller' },
      \ {'word' : 'session_migration'   },
      \ {'word' : 'stylesheets'         },
      \ ]
"
" gather candidates
"
function! unite#sources#rails#collector#destroy#candidates(source)
  let destory_cmd = g:unite_rails#executable_prefix . ' ' . g:unite_rails#executable . ' ' . 'destroy'
  return unite#sources#rails#helper#gather_candidates_cmd_input(destory_cmd , s:arguments)
endfunction

