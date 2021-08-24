function fish_user_key_bindings

	## Greeting message
	set -U fish_greeting "term
    A ^|v      search history for token
    A w        short description
    v (less)   edit in editor
    type       (which)
vim
    C t|x|v    fzf.vim opens in new (tab|split|vsplit)
    gt|gT      tab next|prev
    [n]gt      nth tab
    <Leader>hp preview the hunk
    <Leader>hs stage the hunk
    <Leader>hu undo the hunk
tmux
    A n        new-window
    C PgDn|Up  next|previous-window
   CS PgDn|Up  swap-window
    A -|\      split-window
    S <|v|^|>  select-pane
    C ^        copy-mode\
"

	function fzf-bcd-widget -d 'cd backwards'
		pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac | eval (__fzfcmd) +m --select-1 --exit-0 --reverse $FZF_DEFAULT_OPTS | read -l result
		[ "$result" ]; and cd $result
		commandline -f repaint
	end

	## Alt+c : cd backwards
	bind \eC fzf-bcd-widget
	## Alt+p : insert `less`
	bind \ep 'commandline --insert " less "'
	## Alt+t  : prepend `tldr`
	bind \et 'commandline " tldr "(commandline)'
	## Alt+/  : prepend `cd`
	bind \e. 'commandline " cd "(commandline)'
	## Alt+v  : prepend ` vim`
	bind \ev 'commandline " vim "(commandline)'
	## Alt+e  : prepend `sudo -E vim`
	bind \ee 'commandline "sudo -E "(commandline)'
	## Ctrl+x : fg
	bind \cx fg

end
