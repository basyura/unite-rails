"
" gather candidates
"
function! unite#sources#rails#collector#bundled_gem#candidates(source)
  let gems = map(
        \ map(
        \   filter(
        \     split(unite#util#system("bundle list"), "\n"),
        \     'v:val =~ "^\ *\\*"'
        \   ), '
        \   substitute(v:val, "\ *\\*\ *", "", "")'), '{
        \ "word" : matchstr(v:val, "[a-zA-Z0-9-_]*"),
        \ "abbr" : v:val
        \ }')

  return map(gems, '{
        \ "word": v:val.word,
        \ "abbr": v:val.abbr,
        \ "kind": "bundled_gem",
        \ }')
endfunction
