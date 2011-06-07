let s:arguments = [
      \ {'word' : 'install'  ,
      \  'abbr' : 'install   - Install the gems specified by the Gemfile or Gemfile.lock'},
      \ {'word' : 'update'   ,
      \  'abbr' : 'update    - Update dependencies to their latest versions'},
      \ {'word' : 'package'  ,
      \  'abbr' : 'package   - Package the .gem files required by  your  application  into  the vendor/cache directory'},
      \ {'word' : 'config'   ,
      \  'abbr' : 'config    - Specify and read configuration options for bundler'},
      \ ]
"
" gather candidates
"
function! unite#sources#rails#collector#bundle#candidates(source)
  return unite#sources#rails#helper#gather_candidates_cmd('bundle' , s:arguments)
endfunction

