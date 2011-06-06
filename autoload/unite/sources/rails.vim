" TODO
"   rails/command
"     history
"     [command] rake
"
"	  immediately
"
" 
"
" autoload/unite/sources/rails/model.vim
"   unite#sources#rails#model#candidates
"     [
"       {  
"         word   : file_name,
"         kind   : file ,
"         action__path      : path ,
"         action__directory : fnamemodify(v:val.path , ":p:h") ,
"       },
"       {
"         word   : command_name,
"         kind   : command ,
"         action__command : command_hoge
"       },
"       ...
"     ]
"
"   source name => model
"

call unite#util#set_default('g:unite_rails_execute_cmd'  , 'VimShellExecute')

let s:places =[
  \ {'name' : 'heroku'      , 'type' : 'cmd'  , 'cmd'  : 'heroku' ,
      \'arguments' : [
      \ ] } ,
  \ {'name' : 'git'         , 'type' : 'cmd'  , 'cmd'  : 'git' ,
      \'arguments' : [
      \ ] } ,
  \ {'name' : 'gem'         , 'type' : 'cmd'  , 'cmd'  : 'gem' ,
      \'arguments' : [
      \ ] } ,
  \  ]

let s:source = {}
"
" define sources
"
function! unite#sources#rails#define()
  
  let rel_path = 'autoload/unite/sources/rails/*.vim'
  let names    = map(split(globpath(&runtimepath, rel_path), "\<NL>") , 
                     \ 'fnamemodify(v:val , ":t:r")')
  let list = []
  for val in names
    let source = copy(s:source)
    let source.description = "candidates from " . val . " list"
    let source.name =  "rails/" . val
    call add(list , source)
  endfor

  return list
endfunction
"
" gather candidates
"
function! s:source.gather_candidates(args, context)
  return s:gather_candidates(self)
endfunction
"
"
function! s:gather_candidates(source)
  let root = s:rails_root()
  if root == "" 
    redraw
    echohl ErrorMsg | echo 'RailsRoot is not exist.' | echohl None | return [] 
  end

  " TODO
  let a:source.source__rails_root = root

  let func_name = "unite#sources#rails#" . 
        \ substitute(a:source.name , 'rails/' , '' , '') . "#candidates"
  return {func_name}(a:source)

  "let type = a:source.type

  "if type == 'dir' || type == 'file'
    "return s:gather_candidates_file(a:source , root)
  "elseif type == 'cmd'
    "return s:gather_candidates_cmd(a:source , root)
  "elseif type == 'cmd_input'
    "return s:gather_candidates_cmd_input(a:source , root)
  "else 
   "return []
  "endif

endfunction
"
" gather file candidates
"
function! unite#sources#rails#gather_candidates_file(path)

  if isdirectory(a:path)
    let files = []
    for f in split(globpath(a:path, '**/*.*') , '\n')
      if isdirectory(f) | continue | endif
      call add(files , 
            \ {'name' : substitute(f , a:path. "/" , "" , "") , 'path' : f })
    endfor
  else
    let files = [{
          \ "name" : fnamemodify(a:path, ":t") ,
          \ "path" : a:path
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
" gather cmd candidates
"
function! unite#sources#rails#gather_candidates_cmd(command, arguments)
  return map(a:arguments , '{
        \ "word" : v:val.word ,
        \ "abbr" : has_key(v:val , "abbr") ? v:val.abbr : v:val.word ,
        \ "kind" : "command" ,
        \ "action__command" : s:execute_cmd() . a:command . " " . v:val.word ,
        \ }')
endfunction
"
" gather cmd input candidates
"
function! unite#sources#rails#gather_candidates_cmd_input(command, arguments) 
  return map(a:arguments , '{
        \ "word" : v:val.word ,
        \ "abbr" : has_key(v:val , "abbr") ? v:val.abbr : v:val.word ,
        \ "kind" : "command" ,
        \ "action__command" : s:create_cmd_input(a:command , v:val.word) , 
        \ }')
endfunction
"
"
function! s:create_cmd_input(cmd, word)
  return "call unite#sources#rails#execute_cmd_input('". a:.cmd . "','" . a:word . "')"
endfunction
"
"
function! unite#sources#rails#execute_cmd_input(cmd, word)
  let msg = input(a:word . " : ")
  if msg == ''
    echo 'abort' | return
  endif
  execute s:execute_cmd() . ' ' . a:cmd . ' ' . a:word . ' ' . msg
endfunction
"
"
function! s:execute_cmd()
  if g:unite_rails_execute_cmd == '!'
    return '!'
  else
    return g:unite_rails_execute_cmd . ' '
  endif
endfunction
"
" get rails root directory
"
function! s:rails_root()
  " TODO
  let dir = finddir("app" , ".;")
  if dir == "" | return "" | endif
  return  dir . "/../" 
endfunction
