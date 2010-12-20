" Version:     0.0.1
" Last Modified: 21 Dec 2010
" Author:      basyura <basyrua at gmail.com>
" Licence:     The MIT License {{{
"     Permission is hereby granted, free of charge, to any person obtaining a copy
"     of this software and associated documentation files (the "Software"), to deal
"     in the Software without restriction, including without limitation the rights
"     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"     copies of the Software, and to permit persons to whom the Software is
"     furnished to do so, subject to the following conditions:
"
"     The above copyright notice and this permission notice shall be included in
"     all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
"     THE SOFTWARE.
" }}}
"
"
" variables
"
"
" source
"
function! unite#sources#r#define()
  return s:unite_source
endfunction
"
let s:unite_source      = {}
let s:unite_source.name = 'r'
let s:unite_source.is_volatile = 1
"let s:unite_source.default_action.common = {
"      \ 'common' : 'open'
"      \ }
let s:unite_source.action_table   = {}
" create list
function! s:unite_source.gather_candidates(args, context)


    let source1 = {
          \ "word"              : "/repos" ,
          \ "action__directory"      : "/repos" ,
          \ "action__path"      : "/repos" ,
          \ "source"            : "r",
          \ "kind"              : "directory"
          \ }
    let source2 = {
          \ "word"              : "/repos/vimfiles/rc/vimrc" ,
          \ "action__path"      : "/repos/vimfiles/rc/vimrc" ,
          \ "source"            : "r",
          \ "kind"              : "file"
          \ }

    let candidates_cache = []
    call add(candidates_cache , source1)
    call add(candidates_cache , source2)

    return candidates_cache

endfunction
"
" action table
"
let s:action_table = {}
let s:unite_source.action_table.common = s:action_table
" 
" action - open
"
let s:action_table.open = {'description' : 'open uiki'}
function! s:action_table.open.func(candidate)
  execute 'edit! ' . a:candidate.source__path
endfunction

