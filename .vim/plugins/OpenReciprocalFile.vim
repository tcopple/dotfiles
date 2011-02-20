let s:version = 1.01
let s:debug = 0


let s:directory_hash = {'include': 'src'}
let s:file_hash = {'Pubfile': 'Pintfile'}
let s:header_pseudo_hash = {'\.h': ['\.cpp', '\.cxx'], '\.hpp': ['\.cpp']}
let s:source_pseudo_hash = {'\.cpp': ['\.h', '\.hpp'], '\.cxx': ['\.h']}
let s:default_file_ext_hash = {'\.h': '\.cxx'}

let s:valid_open_modes = ['vsplit', 'tab new']


function! CheckOpenMode(open_mode)

  for mode in s:valid_open_modes
    if a:open_mode == mode
      return 1
    endif
  endfor

  return 0

endfunction


function! PrintDebugMessage(message)

  if s:debug
    echo a:message
  endif

endfunction


function! Reciprocate(expression, lhs, rhs)

  if match(a:expression, a:lhs) >= 0
    return substitute(a:expression, a:lhs, a:rhs, '')
  elseif match(a:expression, a:rhs) >= 0
    return substitute(a:expression, a:rhs, a:lhs, '')
  else
    return ''
  endif

endfunction


function! ReciprocateThroughHash(expression, hash)

  for key in sort(keys(a:hash))

    let new_expression = Reciprocate(a:expression, key, a:hash[key])
    if strlen(new_expression)
      return new_expression
    endif

  endfor

  return ''

endfunction


function! ChangeToReciprocalDirectory(filepath)

  return ReciprocateThroughHash(a:filepath, s:directory_hash)

endfunction


function! ChangeToReciprocalFilename(filepath)

  if expand('%:t:r') == 'Pubfile'
    let s:swap = 1
  endif
  return ReciprocateThroughHash(a:filepath, s:file_hash)

endfunction


function! ReciprocateThroughPseudoHash(filepath, pseudo_hash)

  let file_ext = '.' . expand('%:e')
  if has_key(a:pseudo_hash, file_ext)

    let values = a:pseudo_hash[file_ext]
    for item in values

      let new_filepath = Reciprocate(a:filepath, file_ext, item)
      let glob_result = glob(new_filepath)
      if strlen(glob_result)
        return new_filepath
      endif

    endfor

  endif

  return ''

endfunction


function! ReciprocateUsingDefaults(filepath)

  let file_extension = '\.' . expand('%:e')
  if file_extension == '\.h'
    let s:swap = 1
  elseif file_extension != '\.cxx'
    echo "Couldn't not match reciprocal file extension to " . file_extension
    return ''
  endif

  return ReciprocateThroughHash(a:filepath, s:default_file_ext_hash)

endfunction


function! ChangeToReciprocalFileExtension(filepath)

  let new_filepath = ReciprocateThroughPseudoHash(a:filepath, s:header_pseudo_hash)
  if strlen(new_filepath)
    let s:swap = 1
    return new_filepath
  endif

  let new_filepath = ReciprocateThroughPseudoHash(a:filepath, s:source_pseudo_hash)
  if strlen(new_filepath)
    return new_filepath
  endif

  return ReciprocateUsingDefaults(a:filepath)

endfunction


function! OpenReciprocalFile(open_mode)

  " variable to swap split windows
  let s:swap = 0

  if !CheckOpenMode(a:open_mode)
    echo "FATAL ERROR: Open mode not found."
  endif

  let filepath = expand('%') " See Vim documentation: cmdline
  call PrintDebugMessage('Original filepath: ' . filepath)

  let new_filepath = ChangeToReciprocalDirectory(filepath)
  if strlen(new_filepath)
    let filepath = new_filepath
  endif
  call PrintDebugMessage('filepath after ChangeToReciprocalDirectory: ' . filepath)

  let file_extension = expand('%:e')
  if strlen(file_extension)
    let filepath = ChangeToReciprocalFileExtension(filepath)
    call PrintDebugMessage('filepath after ChangeToReciprocalFileExtension: ' . filepath)
  else
    let filepath = ChangeToReciprocalFilename(filepath)
    call PrintDebugMessage('filepath after ChangeToReciprocalFilename: ' . filepath)
  endif

  call PrintDebugMessage("Complete filepath: " . filepath)

  if !strlen(filepath)
    echo "FATAL ERROR: Empty filepath."
    return
  endif

  exec a:open_mode . ' ' . filepath

  if a:open_mode == 'vsplit' && s:swap
    exec 'wincmd x'
  endif

endfunction
