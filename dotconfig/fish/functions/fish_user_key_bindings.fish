function fish_user_key_bindings

	## Greeting message
	set -U fish_greeting "term
    A ↑|↓      search history for token
    A w        short description
    gibo       gitignore boilerplates
vim
    C t|x|v    fzf.vim opens in new (tab|split|vsplit)
    gt|gT      tab next|prev
    [n]gt      nth tab
    <Leader>hp preview the hunk
    <Leader>hs stage the hunk
    <Leader>hu undo the hunk
tmux
    A n        new-window
    A ←|→      next|previous-window
   AS ←|→      swap-window
    A -|\      split-window
    S ←|↓|↑|→  select-pane
    C ↑        copy-mode\
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
