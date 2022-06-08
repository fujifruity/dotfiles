function statusline_update
    test -z "$statusline_update"
    and set -U statusline_update 0
    or  set -U statusline_update (math "bitxor(1,"$statusline_update")")
end
