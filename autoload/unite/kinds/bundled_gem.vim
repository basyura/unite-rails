function! unite#kinds#bundled_gem#define()
  return s:kind
endfunction

let s:kind = {
      \ 'name' : 'bundled_gem',
      \ 'default_action' : 'file_rec',
      \ 'action_table' : {}
      \ }

function! s:get_bundled_gem_path(gem_name)
  return substitute(unite#util#system('bundle show ' . a:gem_name), "\n", '', '')
endfunction

let s:kind.action_table.file_rec = {
      \ 'description' : "open this gem's directory by file_rec source"
      \ }

function! s:kind.action_table.file_rec.func(candidate)
  let path = s:get_bundled_gem_path(a:candidate.word)
  call unite#start([['file_rec', path]])
endfunction

let s:kind.action_table.file = {
      \ 'description' : "open this gem's directory by file source"
      \ }

function! s:kind.action_table.file.func(candidate)
  let path = s:get_bundled_gem_path(a:candidate.word)
  call unite#start([['file', path]])
endfunction
