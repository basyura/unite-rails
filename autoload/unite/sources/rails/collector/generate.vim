let s:arguments_input = [
      \ {'word' : 'controller'          , 'abbr' : 'controller    - name action'},
      \ {'word' : 'generator'           },
      \ {'word' : 'helper'              },
      \ {'word' : 'integration_test'    },
      \ {'word' : 'mailer'              },
      \ {'word' : 'migration'           },
      \ {'word' : 'model'               , 'abbr' : 'model         - name field:type field:type'},
      \ {'word' : 'observer'            },
      \ {'word' : 'performance_test'    },
      \ {'word' : 'plugin'              },
      \ {'word' : 'resource'            },
      \ {'word' : 'scaffold'            },
      \ {'word' : 'scaffold_controller' },
      \ {'word' : 'session_migration'   },
      \ {'word' : 'stylesheets'         },
      \ ]
let s:arguments_cmd = [
      \ {'word' : 'jquery:install'      },
      \ {'word' : 'devise:install'      },
      \ {'word' : 'devise:views'        },
      \ ]
"
" gather candidates
"
function! unite#sources#rails#collector#generate#candidates(source)
  let generate_cmd = g:unite_rails#executable_prefix . ' ' . g:unite_rails#executable . ' ' . 'generate'
  let input = unite#sources#rails#helper#gather_candidates_cmd_input(generate_cmd, s:arguments_input)
  let cmd   = unite#sources#rails#helper#gather_candidates_cmd(generate_cmd , s:arguments_cmd)
  return input + cmd
endfunction

