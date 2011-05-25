" source
"
function! unite#sources#rails#define()
  return [
        \ s:source_model ,
        \ s:source_controller ,
        \ s:source_view ,
        \ ]
endfunction

let s:action_table = {'open' : {'description' : 'open file'}}
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
  return s:create_sources('/app/models')
endfunction

function! s:source_controller.gather_candidates(args, context)
  return s:create_sources('/app/controllers')
endfunction

function! s:source_view.gather_candidates(args, context)
  return s:create_sources('/app/views')
endfunction

function! s:create_sources(path)
  let root = s:rails_root()
  if root == "" | return [] | end
  let files = map(split(globpath(root . a:path , '**') , '\n') , '{
          \ "name" : fnamemodify(v:val , ":t:r") ,
          \ "path" : v:val
          \ }')

  let list = []
  for f in files
    if filereadable(f.path)
      call add(list , {
        \ "abbr"         : substitute(f.path , root . a:path . '/' , '' , ''),
        \ "word"         : substitute(f.path , root . a:path . '/' , '' , ''),
        \ "source__path" : f.path ,
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
