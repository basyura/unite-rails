"
let s:places =[
      \ {'name' : 'model'      , 'path' : '/app/models'         } , 
      \ {'name' : 'controller' , 'path' : '/app/controllers'    } ,
      \ {'name' : 'view'       , 'path' : '/app/views'          } ,
      \ {'name' : 'helper'     , 'path' : '/app/helpers'        } ,
      \ {'name' : 'mailer'     , 'path' : '/app/mailers'        } ,
      \ {'name' : 'lib'        , 'path' : '/lib'                } ,
      \ {'name' : 'db'         , 'path' : '/db'                 } ,
      \ {'name' : 'config'     , 'path' : '/config'             } ,
      \ {'name' : 'log'        , 'path' : '/log'                } ,
      \ {'name' : 'javascript' , 'path' : '/public/javascripts' } ,
      \ {'name' : 'stylesheet' , 'path' : '/public/stylesheets' } ,
      \  ]

let s:source = {}
"
"
function! s:source.gather_candidates(args, context)
  return s:create_sources(self.path)
endfunction
"
" rails/command
"   history
"   [command] rake
"
let s:source_command = {}

"
"
function! unite#sources#rails#define()
  return map(s:places ,
        \   'extend(copy(s:source),
        \    extend(v:val, {"name": "rails/" . v:val.name,
        \   "description": "candidates from history of " . v:val.name}))')
endfunction
"
"
function! s:create_sources(path)
  let root = s:rails_root()
  if root == "" | return [] | end
  let files = map(split(globpath(root . a:path , '**') , '\n') , '{
          \ "name" : fnamemodify(v:val , ":t:r") ,
          \ "path" : v:val
          \ }')

  let list = []
  for f in files
    if isdirectory(f.path) | continue | endif
    call add(list , {
          \ "abbr" : substitute(f.path , root . a:path . '/' , '' , ''),
          \ "word" : substitute(f.path , root . a:path . '/' , '' , ''),
          \ "kind" : "file" ,
          \ "action__path"      : f.path ,
          \ "action__directory" : fnamemodify(f.path , ':p:h:h') ,
          \ })
  endfor

  return list
endfunction
"
"
function! s:rails_root()
  " TODO
  let dir = finddir("app" , ".;")
  if dir == "" | return "" | endif
  return  dir . "/../" 
endfunction
