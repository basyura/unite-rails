if !exists('g:unite_rails#executable_prefix')
  if executable('spring')
    let g:unite_rails#executable_prefix = 'spring'
  else
    let g:unite_rails#executable_prefix = 'bundle exec'
  end
end

if !exists('g:unite_rails#executable')
  let g:unite_rails#executable = 'rails'
end
