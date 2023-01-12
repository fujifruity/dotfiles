#
# User initialization
#

## Source my functions
set fish_function_path ~/.config/fish/functions/myfn $fish_function_path

## Unset an out-of-date variable tmux set
set -e I3SOCK

## Notify if finished command took time
function _notify_command_return --on-event fish_prompt
    test $CMD_DURATION > /dev/null
    and test $CMD_DURATION -gt (math "1000 * 9")
    and set sec (math -s0 "$CMD_DURATION / 1000")
    and dunstify "$history[1]" (date -d@$sec -u +%M:%S)
end

set -gx SHELL "fish"
set -gx LESSOPEN "| cat %s"
set -gx LESS " -FRXi"
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/fuji/.ghcup/bin $PATH # ghcup-env
