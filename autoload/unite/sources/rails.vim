"
let s:places =[
  \ {'name' : 'model'       , 'type' : 'dir'  , 'path' : '/app/models'          } , 
  \ {'name' : 'controller'  , 'type' : 'dir'  , 'path' : '/app/controllers'     } ,
  \ {'name' : 'view'        , 'type' : 'dir'  , 'path' : '/app/views'           } ,
  \ {'name' : 'helper'      , 'type' : 'dir'  , 'path' : '/app/helpers'         } ,
  \ {'name' : 'mailer'      , 'type' : 'dir'  , 'path' : '/app/mailers'         } ,
  \ {'name' : 'lib'         , 'type' : 'dir'  , 'path' : '/lib'                 } ,
  \ {'name' : 'db'          , 'type' : 'dir'  , 'path' : '/db'                  } ,
  \ {'name' : 'config'      , 'type' : 'dir'  , 'path' : '/config'              } ,
  \ {'name' : 'routes'      , 'type' : 'file' , 'path' : '/config/routes.rb'    } ,
  \ {'name' : 'initializer' , 'type' : 'dir'  , 'path' : '/config/initializers' } ,
  \ {'name' : 'log'         , 'type' : 'dir'  , 'path' : '/log'                 } ,
  \ {'name' : 'javascript'  , 'type' : 'dir'  , 'path' : '/public/javascripts'  } ,
  \ {'name' : 'stylesheet'  , 'type' : 'dir'  , 'path' : '/public/stylesheets'  } ,
  \  ]

let s:source = {}
"
"
function! s:source.gather_candidates(args, context)
  return s:create_sources(self)
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
function! s:create_sources(source)
  let root = s:rails_root()
  if root == "" | return [] | end

  let files = []
  let target = root . a:source.path
  if a:source.type == 'dir'
    let files = map(split(globpath(target , '**') , '\n') , '{
          \ "name" : substitute(v:val , target . "/" , "" , "") ,
          \ "path" : v:val
          \ }')
  elseif a:source.type == 'file'
    let files = [{
          \ "name" : fnamemodify(target , ":t") ,
          \ "path" : target
          \ }]
  endif

  let list = []
  for f in files
    if isdirectory(f.path) | continue | endif
    call add(list , {
          \ "abbr" : f.name ,
          \ "word" : f.name ,
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
