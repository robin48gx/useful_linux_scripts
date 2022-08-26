
" Original vi users expect that if you are in INSERT mode and an arrow key is pressed it will hop back into
" command mode. 
" On cursor key go back to command mode
" as soon as a cursor key is pressed
"
inoremap <left> <esc><left>
inoremap <right> <esc><right>
inoremap <up> <esc><up>
inoremap <down> <esc><down>

" this defaults vi to show line numbers on the lhs; you can turn this off with :set nonu
set nu
set hlsearch
set incsearch
"
" this sets the title in a gnome terminal window, shows which file is being edited by VIM
set title
"
" this resets the window title when vim exits
"
set titleold=
"
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
autocmd bnf             *.spec	call SKEL_spec()
export git_branch=$(formattedGitBranch)
echo $git_branch
#PROMPT_COMMAND='echo -ne "\033]0;SOME TITLE HERE\007"'
PROMPT_COMMAND='echo -ne "\033]0; `pwd`  $git_branch \007"'


" filetypes
filetype plugin on
filetype indent on
" ~/.vimrc ends here
