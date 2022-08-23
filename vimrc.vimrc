
" Old vi users expect that if you are in INSERT mode and an arrow key is pressed it will hop back into
" command mode. New users find this very frustrating. I find it frustrating that it stays in insert mode because I am old RPC 23AUG2022.
" go back to command mode
" as soon as a cursor key is pressed
"
inoremap <left> <esc><left>
inoremap <right> <esc><right>
inoremap <up> <esc><up>
inoremap <down> <esc><down>

set nu
set hlsearch
set incsearch
"
" this sets the title in a gnome terminal window, shows which file is being edited by VIM
set title
"
"
" from vim forum http://vim.wikia.com/wiki/Show_fileencoding_and_bomb_in_the_status_line
"
if has("statusline")
	 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_EN
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on
" ~/.vimrc ends here
