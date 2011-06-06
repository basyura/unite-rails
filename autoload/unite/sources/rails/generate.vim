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
      \ {'word' : 'jquery:install'      },
      \ ]
"
" gather candidates
"
function! unite#sources#rails#generate#candidates(source)
  return unite#sources#rails#gather_candidates_cmd_input('rails generate' , s:arguments)
endfunction

