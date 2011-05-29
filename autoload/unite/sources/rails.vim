" TODO
"   rails/command
"     history
"     [command] rake
"
"	  immediately
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
  \ {'name' : 'rake'        , 'type' : 'cmd'  , 'cmd'  : [
      \ 'about' , 'db:create' , 'db:drop' , 'db:fixtures:load' , 'db:migrate' ,
      \ 'db:migrate:status' , 'db:rollback' , 'db:schema:dump' , 'db:schema:load' ,
      \ 'db:seed' , 'db:setup' , 'db:structure:dump' , 'db:version' , 'doc:app' ,
      \ 'log:clear' , 'middleware' , 'notes' , 'notes:custom' , 'rails:template' ,
      \ 'rails:update' , 'routes' , 'secret' , 'stats' , 'test' , 'test:recent' ,
      \ 'test:uncommitted' , 'time:zones:all' , 'tmp:clear' , 'tmp:create'
      \ ] } ,
  \  ]

let s:source = {}
"
"
function! s:source.gather_candidates(args, context)
  return s:create_sources(self)
endfunction
"
"
let s:source_command = {}

"
"
function! unite#sources#rails#define()
  return map(s:places ,
        \   'extend(copy(s:source),
        \    extend(v:val, {"name": "rails/" . v:val.name,
        \   "description": "candidates from " . v:val.name}))')
endfunction
"
"
function! s:create_sources(source)
  let root = s:rails_root()
  if root == "" | return [] | end

  let type = a:source.type

  if type == 'dir' || type == 'file'
    return s:create_sources_with_file(a:source , root)
  elseif type == 'cmd'
    return s:create_sources_with_cmd(a:source , root)
  else 
   return []
  endif

endfunction
"
"
function! s:create_sources_with_file(source, root)
  let target = a:root . a:source.path

  if isdirectory(target)
    let files = map(split(globpath(target , '**/*.*') , '\n') , '{
          \ "name" : substitute(v:val , target . "/" , "" , "") ,
          \ "path" : v:val
          \ }')
  else
    let files = [{
          \ "name" : fnamemodify(target , ":t") ,
          \ "path" : target
          \ }]
  endif

  return map(files , '{
          \ "word" : v:val.name ,
          \ "kind" : "file" ,
          \ "action__path"      : v:val.path ,
          \ "action__directory" : fnamemodify(v:val.path , ":p:h") ,
          \ }')
endfunction
"
"
function! s:create_sources_with_cmd(source, root)
  return map(a:source.cmd , '{
        \ "word" : v:val ,
        \ "kind" : "command" ,
        \ "action__command"   : "rake " . v:val ,
        \ }')
endfunction
"
"
function! s:rails_root()
  " TODO
  let dir = finddir("app" , ".;")
  if dir == "" | return "" | endif
  return  dir . "/../" 
endfunction
