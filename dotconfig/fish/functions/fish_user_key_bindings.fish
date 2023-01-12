function fish_user_key_bindings

    ## Greeting message
    set -U fish_greeting "\
term
    A ^|v      search history for token
    A w        short description
    v (less)   edit in editor
vim
    C t|x|v    fzf.vim opens in new (tab|split|vsplit)
    <Leader>hp preview the hunk
    <Leader>hs stage the hunk
    <Leader>hu undo the hunk"

    # Enable fzf
    if command -s fzf-share >/dev/null
      source (fzf-share)/key-bindings.fish
    end
    fzf_key_bindings

    function gen-fzf-cd-widget
        set -l cmd $argv[1]
        test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
        begin
            set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS"
            eval "$cmd | "(__fzfcmd)' +m' | read -l result
            [ -n "$result" ] && cd -- $result
        end
        commandline -f repaint
    end

    function ancestors
        pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac
    end
    function fzf-bcd-widget -d 'cd backwards'
        gen-fzf-cd-widget 'ancestors'
    end
    bind \e. fzf-bcd-widget

    function fzf-zcd-widget -d 'cd with z'
        gen-fzf-cd-widget "z -l | awk '{ print \$2 }'"
    end
    bind \ez fzf-zcd-widget

    bind \et 'commandline " tldr "(commandline)'
    bind \ev 'commandline " vim "(commandline)'
    bind \e\cS 'git status ; commandline -f repaint'
    bind \e\f  'git log ; commandline -f repaint'
    bind \e\b  'git show ; commandline -f repaint'
    bind \e\cD 'git diff ; commandline -f repaint'
    bind \cx fg

end
