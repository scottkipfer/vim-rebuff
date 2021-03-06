if exists("g:rebuff_loaded") || &cp | finish | endif

let g:rebuff_loaded = 1

if !exists('g:rebuff')
  let g:rebuff = {}
endif

call rum#ignore('\[Rebuff\]')

function! Rebuff()
  " Dependencies :(
  " Vim has no better way to deal with this at the moment.
  " Putting them here, instead of at the top, defers the
  " check until Rebuff is used, which maybe is a little more
  " annoying for users but makes the loading order for these
  " plugins not matter.
  if !exists("g:lodash_loaded")
    echo 'Rebuff requires vim-lodash. See https://github.com/tandrewnichols/vim-lodash.'
  endif

  if !exists("g:rum_loaded")
    echo 'Rebuff requires vim-rumrunner. See https://github.com/tandrewnichols/vim-rumrunner.'
  endif

  if !exists("loaded_projectroot")
    echo 'Rebuff requires vim-projectroot. See https://github.com/dbakker/vim-projectroot.'
  endif

  if !exists("g:lodash_loaded") || !exists("g:rum_loaded") || !exists("g:loaded_projectroot")
    return
  endif

  call rebuff#open()
endfunction

command! -nargs=0 Ls :call Rebuff()
command! -nargs=0 Rebuff :call Rebuff()

nnoremap <Plug>RebuffOpen :Rebuff<CR>

if !hasmapto('<Plug>RebuffOpen')
  nmap <leader>ls <Plug>RebuffOpen
endif
