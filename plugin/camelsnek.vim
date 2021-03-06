" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development.
"if exists("g:loaded_camelsnek")
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_camelsnek = 1

" Settings: {{{1
if !exists('g:camelsnek_alternative_camel_commands')
  let g:camelsnek_alternative_camel_commands = 0
end

if !exists('g:camelsnek_no_fun_allowed')
  let g:camelsnek_no_fun_allowed = 0
end

" Handles iskeyword update to make kebab editing easy.
if !exists('g:camelsnek_iskeyword_override')
  let g:camelsnek_iskeyword_override = 0
end

" NOTE: this updates users' iskeyword global setting and may not be the right
" solution, hence the override variable to remove this global change.
" I prefer that kebab can change to snake case when in the middle of word, but YMMV.
if g:camelsnek_iskeyword_override
  set iskeyword+=-
end

" Private Functions: {{{1

function! s:repl(count, fn) abort
  let l:s = @s
  if a:count < 1
    exe "norm! \"sciw\<C-R>=camelsnek#" . a:fn ."(@s)\<CR>"
  else
    exe "norm! gv\"sc\<C-R>=camelsnek#" . a:fn ."(@s)\<CR>"
  endif
  let @s = l:s
endfunction

" Maps: {{{1
"nnoremap <Plug>CAMELSNEK1 :call <SID>some_local_function()<CR>
"nnoremap <Plug>CAMELSNEK2 :call SomeFunction()<CR>

" Commands: {{{1

if g:camelsnek_alternative_camel_commands
  command! -nargs=0 -range -bar Pascal :call <SID>repl(<count>, 'camel')
  command! -nargs=0 -range -bar Camel :call <SID>repl(<count>, 'camelback')
else
  command! -nargs=0 -range -bar Camel :call <SID>repl(<count>, 'camel')
  command! -nargs=0 -range -bar CamelB :call <SID>repl(<count>, 'camelback')
endif

command! -nargs=0 -range -bar Kebab :call <SID>repl(<count>, 'kebab')

if g:camelsnek_no_fun_allowed
  command! -nargs=0 -range -bar Snake :call <SID>repl(<count>, 'snek')
  command! -nargs=0 -range -bar Snakecaps :call <SID>repl(<count>, 'screm')
else
  command! -nargs=0 -range -bar Snek :call <SID>repl(<count>, 'snek')
  command! -nargs=0 -range -bar Screm :call <SID>repl(<count>, 'screm')
endif

" Teardown: {{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
