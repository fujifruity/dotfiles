#
# User initialization
#

## Source my functions
set fish_function_path ~/.config/fish/functions/myfn $fish_function_path

## Unset an out-of-date variable tmux creates.
set -e I3SOCK

## Activate FZF keybindings
fzf_key_bindings

## Notify if finished command took time
function _notify_command_return --on-event fish_prompt
    if test $CMD_DURATION > /dev/null
        if test $CMD_DURATION -gt (math "1000 * 9")
            set sec (math -s0 "$CMD_DURATION / 1000")
            notify-send "$history[1] / time="(format_seconds $sec)
        end
    end
end

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

#
# Keybindings
#

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

