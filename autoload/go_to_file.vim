" ============================================================================
" File:        autoload/go_to_file.vim
" Description: Core logic for the :GoToFile command.
" Author:      Vasilii Pochkaenko <pochkaenkov@yandex.ru>
" URL:         https://github.com/1KoT1/go_to_file
" ============================================================================

" _(text)                                           *go_to_file-function-_*
"   Translate |text| using the 'go_to_file' gettext domain. Falls back to
"   the original string when gettext is not available.
function! _(text) abort
	if has('gettext')
		return gettext(a:text, 'go_to_file')
	endif
	return a:text
endfunction


" go_to_file#Go()                                   *go_to_file-function-Go*
"
" Open the file under the cursor.
function! go_to_file#Go() abort
	let l:file_name = expand('<cfile>')
	let l:file_name_escaped = fnameescape(l:file_name)
	if !filereadable(l:file_name_escaped)
		echohl ErrorMsg
		echom printf(_('File "%s" not found in predefined directories'), l:file_name)
		echohl None
		return
	endif

	" Extract a trailing line number after the filename on the current line.
	let l:line_num = matchstr(getline('.'), '[^'.l:file_name.']\zs\d\+', col('.'))

	if winnr('$') > 1
		wincmd w
		execut 'edit '.l:file_name_escaped
	else
		execute (g:go_to_file_vertical ? 'vertical ' : '').'split '.l:file_name_escaped
	endif

	if !empty(l:line_num)
		call cursor(l:line_num, 0)
	endif
endfunction
