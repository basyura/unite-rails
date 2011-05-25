" source
"
function! unite#sources#rails#define()
  return [
        \ s:source_model ,
        \ s:source_controller ,
        \ s:source_view ,
        \ ]
endfunction

let s:action_table = {'open' : {'description' : 'open model'}}
function! s:action_table.open.func(candidate)
  execute 'edit! ' . a:candidate.source__path
endfunction

"
let s:source_model = {
      \ 'name'           : 'rails/model' ,
      \ 'description'    : 'candidates from model list' ,
      \ 'default_action' : {'common' : 'open'} ,
      \ 'action_table'   : {'common' : s:action_table}
      \ }
let s:source_controller = {
      \ 'name'           : 'rails/controller' ,
      \ 'description'    : 'candidates from controller list' ,
      \ 'default_action' : {'common' : 'open'} ,
      \ 'action_table'   : {'common' : s:action_table}
      \ }
let s:source_view = {
      \ 'name'           : 'rails/view' ,
      \ 'description'    : 'candidates from view list' ,
      \ 'default_action' : {'common' : 'open'} ,
      \ 'action_table'   : {'common' : s:action_table}
      \ }

function! s:source_model.gather_candidates(args, context)
  let root = s:rails_root()
  if root == "" | return [] | end

  let models = map(split(globpath(root . '/app/models' , '*.rb') , '\n') , '{
          \ "name" : fnamemodify(v:val , ":t:r") ,
          \ "path" : v:val
          \ }')

  return map(models , '{
        \ "abbr"         : v:val.name ,
        \ "word"         : v:val.name ,
        \ "source__path" : v:val.path ,
        \ }')
endfunction

function! s:source_controller.gather_candidates(args, context)
  let root = s:rails_root()
  if root == "" | return [] | end

  let models = map(split(globpath(root . '/app/controllers' , '*.rb') , '\n') , '{
          \ "name" : fnamemodify(v:val , ":t:r") ,
          \ "path" : v:val
          \ }')

  return map(models , '{
        \ "abbr"         : v:val.name ,
        \ "word"         : v:val.name ,
        \ "source__path" : v:val.path ,
        \ }')
endfunction

function! s:source_view.gather_candidates(args, context)
  let root = s:rails_root()
  if root == "" | return [] | end
  let models = map(split(globpath(root . '/app/views' , '**') , '\n') , '{
          \ "name" : fnamemodify(v:val , ":t:r") ,
          \ "path" : v:val
          \ }')

  let list = []
  for m in models
    if filereadable(m.path)
      call add(list , {
        \ "abbr"         : substitute(m.path , root . '/app/views/' , '' , ''),
        \ "word"         : substitute(m.path , root . '/app/views/' , '' , ''),
        \ "source__path" : m.path ,
        \ })
    endif
  endfor

  return list
endfunction

function! s:rails_root()
  let dir = substitute(expand("%:p:h")," ","\\\\ ","g") 
  while 1
    let list = split(dir , '/')
    if len(list) == 1
      break
    endif
    let dir = join(list[:len(list) - 2] , '/')
    if filereadable(dir . '/Gemfile') && filereadable(dir . '/config.ru')
      return dir
    endif
  endwhile
  return ""
endfunction
