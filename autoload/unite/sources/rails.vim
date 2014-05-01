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

let s:source = {}
"
" define sources
"
function! unite#sources#rails#define()
  
  let rel_path = 'autoload/unite/sources/rails/collector/*.vim'
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
  let root = unite#sources#rails#helper#rails_root()
  if root == "" 
    redraw
    echohl ErrorMsg | echo 'RailsRoot does not exist.' | echohl None | return [] 
  end

  " TODO
  let a:source.source__rails_root = root

  let func_name = "unite#sources#rails#collector#" . 
        \ substitute(a:source.name , 'rails/' , '' , '') . "#candidates"
  return {func_name}(a:source)
endfunction
