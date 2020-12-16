function fish_user_key_bindings

	## Greeting message
	set -U fish_greeting "\
 Alt + ↑/↓ : search history for token
 Alt + w   : short description
 Alt + p   : append `| less --ignore-case`
 Alt + t   : prepend `tldr `
 Alt + /   : prepend `cd `
 Alt + e   : prepend `sudo -E `
Ctrl + x   : fg
gibo       : gitignore boilerplates\
"

	## Alt+p : append `| less -i`
	bind \ep 'commandline --append " | less --ignore-case"'
	## Alt+t  : prepend `tldr`
	bind \et 'commandline " tldr "(commandline)'
	## Alt+/  : prepend `cd`
	bind \e/ 'commandline " cd "(commandline)'
	## Alt+v  : prepend ` vim`
	bind \ev 'commandline " vim "(commandline)'
	## Alt+e  : prepend `sudo -E vim`
	bind \ee 'commandline "sudo -E "(commandline)'
	## Ctrl+x : fg
	bind \cx fg

end
