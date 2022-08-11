function guixinstall -a query
    test -n "$FZF_TMUX_HEIGHT" || set FZF_TMUX_HEIGHT 40%
    set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS"
    set -l combined (guix search "$query" | string split0)
    set -l names (echo $combined \
        | grep -oP '(name|version): .*' \
        | sed -r 's/(name: |version: )//' \
        | sed 'N;s/\n/@/' \
        | fzf -m --preview "guix show {}")
    test -n "$names" && guix install "$names"
end
