" ============================================================================
" File:        plugin/go_to_file.vim
" Description: Plugin loader — defines the |:GoToFile| command.
" Author:      Vasilii Pochkaenko <pochkaenkov@yandex.ru>
" URL:         https://github.com/1KoT1/go_to_file
" ============================================================================

if exists('g:loaded_go_to_file')
	finish
endif
let g:loaded_go_to_file = 1

" ---------------------------------------------------------------------------
" Gettext initialisation                                          {{{1
" ---------------------------------------------------------------------------
" Check if gettext feature is compiled into Vim.
if has('gettext')
	" Get the absolute path to your plugin's 'lang' directory.
	let s:lang_dir = fnamemodify(expand('<sfile>'), ':p:h:h') . '/lang'

	" Bind your unique plugin domain name to that directory.
	call bindtextdomain('go_to_file', s:lang_dir)
endif
" }}}

" ---------------------------------------------------------------------------
" g:go_to_file_vertical                               {{{1
"
" Type:     Boolean
" Default:  1
"
" When 1 (true), the plugin opens a vertical split for the target file.
" When 0 (false), a horizontal split is used instead.
"
" This option is only consulted when there is exactly one window on the
" screen.  When multiple windows already exist the plugin reuses the next
" window regardless of this setting.
" }}}
if !exists('g:go_to_file_vertical')
	let g:go_to_file_vertical = 1
endif

" ---------------------------------------------------------------------------
" :GoToFile  command                                        *:GoToFile*
"
" Open the file under the cursor with smart window management.
" See |go_to_file#Go()| for details on the windowing logic and automatic
" line-number detection.
" ---------------------------------------------------------------------------
command! GoToFile call go_to_file#Go()
